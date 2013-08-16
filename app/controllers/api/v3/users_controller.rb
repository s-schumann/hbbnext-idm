module Api
  module V3
    class UsersController < ApplicationController
      before_filter :restrict_access
      respond_to :json

      # GET /users.json
      def index
      	@users = User.all
        respond_with @users
      end

      # GET /users/1.json
      def show
      	@user = User.find(params[:id])
        normalize_mmi

        @cids = []
        @user.udrs.each do |udr|
          udr.contexts.each do |context|
            @cids.push(context.id)
          end
        end

        respond_with @user, @cids
      end

      # POST /users.json
      def create
        @user = User.new(params[:user])
        @user.uuid = SecureRandom.uuid
        current_consumer ||= Consumer.find_by_access_token(params[:access_token])
        @user.created_by = current_consumer.email
        if @user.save
          set_udr_name
          fill_empty_or_null
          respond_with @user, status: :created, location: @user
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      # PUT /users/1.json
      def update
        @user = User.find(params[:id])
        if not @user.created_by
          current_consumer ||= Consumer.find_by_access_token(params[:access_token])
          @user.created_by = current_consumer.email
          @user.save
        end
        @user = User.update(params[:id], params[:user])
        set_udr_name
        fill_empty_or_null
        normalize_face
        normalize_voice
        respond_with @user
      end

      # DELETE /users/1.json
      def destroy
        @user = User.destroy(params[:id])
        respond_with @user
      end

      private
        def restrict_access
          api_key = Consumer.find_by_access_token(params[:access_token])
          head :unauthorized unless api_key
        end
        def set_udr_name
          @user.udrs.each do |udr|
            @user.attributes = {
              :udrs_attributes => [
                { :id => udr.id,
                  :name => "#{@user.username}:#{@user.devices.find(udr.device_id).display_name}",
                  :role_id => 4
                }
              ]
            }
            if not udr.uuid
              udr.uuid = SecureRandom.uuid
            end
            if not udr.created_by
              current_consumer ||= Consumer.find_by_access_token(params[:access_token])
              udr.created_by = current_consumer.email
            end
          end
          @user.update_attributes(params[:user])
        end
        def fill_empty_or_null
          if @user.avatar.blank?
            @user.avatar = "http://www.wpclipart.com/people/faces/anonymous/photo_not_available_large.png"
          end
          if @user.pref_price.blank?
            @user.pref_price = "0.5"
          end
          if @user.pref_usability.blank?
            @user.pref_usability = "0.5"
          end
          if @user.pref_responsiveness.blank?
            @user.pref_responsiveness = "0.5"
          end
          @user.save
        end
        def normalize_face
          logger.info "Normalizing Face..."

          # config variables
          range = $normalizationInterval
          now = Time.now.to_i
          debug = true

          # test variables
          user_id = @user.id
          mmi_face = @user.mmi_face.to_i
          logger.info "user ID: #{user_id} - MMI value: #{mmi_face}" if debug

          #  db connection to localhost with the default port
          db = Mongo::Connection.new.db('hbbnext-idm2_development')

          # collections
          faces = db.collection('face')

          # new item
          new_face = { :user => user_id, :probability => mmi_face, :created_at => now }

          # insert
          face_id = faces.insert(new_face)

          # Normalize
          # Get all user values first
          norm = Array.new
          all_faces = faces.find(:user => user_id).each do |slice|
             logger.info slice.inspect if debug
             # If created within range add value to normalization var collector
             if(slice["created_at"] >= now - range)
                norm.push(slice["probability"])
                logger.info norm if debug
             end
          end
          logger.info "Normalize #{norm.count} values" if debug
          logger.info "Array:" if debug
          logger.info norm if debug

          # Calculate normalized value
          logger.info "Norm:" if debug
          sum = 0
          norm.each do |n|
             sum += n
          end

          # Present normalized value
          logger.info sum/norm.count if debug
          @user.mmi_face = sum/norm.count
          @user.save

          # Drop older than required value
          all_faces = faces.find(:user => user_id).each do |slice|
           if(slice["created_at"] < now - range)
              faces.remove(slice)
             end
          end

          # Create index for user and probability
          faces.create_index("user")
          faces.create_index("probability")
        end

        def normalize_voice
          logger.info "Normalizing Voice..."

          # config variables
          range = $normalizationInterval
          now = Time.now.to_i
          debug = true

          # test variables
          user_id = @user.id
          mmi_voice = @user.mmi_voice.to_i
          logger.info "user ID: #{user_id} - MMI value: #{mmi_voice}" if debug

          #  db connection to localhost with the default port
          db = Mongo::Connection.new.db('hbbnext-idm2_development')

          # collections
          voices = db.collection('voice')

          # new item
          new_voice = { :user => user_id, :probability => mmi_voice, :created_at => now }

          # insert
          voice_id = voices.insert(new_voice)

          # Normalize
          # Get all user values first
          norm = Array.new
          all_voices = voices.find(:user => user_id).each do |slice|
             logger.info slice.inspect if debug
             # If created within range add value to normalization var collector
             if(slice["created_at"] >= now - range)
                norm.push(slice["probability"])
                logger.info norm if debug
             end
          end
          logger.info "Normalize #{norm.count} values" if debug
          logger.info "Array:" if debug
          logger.info norm if debug

          # Calculate normalized value
          logger.info "Norm:" if debug
          sum = 0
          norm.each do |n|
             sum += n
          end

          # Present normalized value
          logger.info sum/norm.count if debug
          @user.mmi_voice = sum/norm.count
          @user.save

          # Drop older than required value
          all_voices = voices.find(:user => user_id).each do |slice|
           if(slice["created_at"] < now - range)
              voices.remove(slice)
             end
          end

          # Create index for user and probability
          voices.create_index("user")
          voices.create_index("probability")
        end
        def normalize_mmi
          logger.info "Normalizing MMI..."

          # config variables
          range = $normalizationInterval
          now = Time.now.to_i
          debug = true

          # test variables
          user_id = @user.id
          logger.info "user ID: #{user_id}" if debug

          #  db connection to localhost with the default port
          db = Mongo::Connection.new.db('hbbnext-idm2_development')

          # collections
          voices = db.collection('voice')
          faces = db.collection('face')

          # Normalize voices
          norm = Array.new
          all_voices = voices.find(:user => user_id).each do |slice|
             logger.info slice.inspect if debug
             # If created within range add value to normalization var collector
             if(slice["created_at"] >= now - range)
                norm.push(slice["probability"])
                logger.info norm if debug
             end
          end
          logger.info "Normalize #{norm.count} voice values" if debug
          logger.info "Array:" if debug
          logger.info norm if debug

          # Calculate normalized value
          logger.info "Norm:" if debug
          sum = 0
          norm.each do |n|
             sum += n
          end

          # Present normalized value
          if(norm.count !=0)
            logger.info sum/norm.count if debug
            @user.mmi_voice = sum/norm.count
          else
            logger.info "0" if debug
            @user.mmi_voice = 0
          end
          @user.save

          # Drop older than required value
          all_voices = voices.find(:user => user_id).each do |slice|
           if(slice["created_at"] < now - range)
              voices.remove(slice)
             end
          end

          # Normalize faces
          norm = Array.new
          all_faces = faces.find(:user => user_id).each do |slice|
             logger.info slice.inspect if debug
             # If created within range add value to normalization var collector
             if(slice["created_at"] >= now - range)
                norm.push(slice["probability"])
                logger.info norm if debug
             end
          end
          logger.info "Normalize #{norm.count} face values" if debug
          logger.info "Array:" if debug
          logger.info norm if debug

          # Calculate normalized value
          logger.info "Norm:" if debug
          sum = 0
          norm.each do |n|
             sum += n
          end

          # Present normalized value
          if(norm.count !=0)
            logger.info sum/norm.count if debug
            @user.mmi_face = sum/norm.count
          else
            logger.info "0" if debug
            @user.mmi_face = 0
          end
          @user.save

          # Drop older than required value
          all_faces = faces.find(:user => user_id).each do |slice|
           if(slice["created_at"] < now - range)
              faces.remove(slice)
             end
          end
        end
    end
  end
end
