class UsersController < ApplicationController

  before_filter :authorize, only: [:new, :create, :edit, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /users/new
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  def create
    @user = User.new(params[:user])

    require 'securerandom'
    @user.uuid = SecureRandom.uuid

    @user.created_by = current_consumer.email

    respond_to do |format|
      if @user.save
        set_udr_name
        format.html { redirect_to @user, notice: 'User was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /users/1
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        if not @user.created_by
          @user.created_by = current_consumer.email
        end
        set_udr_name
        normalize_face
        normalize_voice
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /users/1
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
    end
  end

  private
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
          udr.created_by = current_consumer.email
        end
      end
      @user.update_attributes(params[:user])
    end

    def normalize_face
      logger.info "Normalizing Face..."

      # config variables
      range = $normalizationInterval
      now = Time.now.to_i
      debug = true

      # test variables
      xuser_id = @user.id
      mmi_face = @user.mmi_face.to_i
      logger.info "xuser ID: #{xuser_id} - MMI value: #{mmi_face}" if debug

      #  db connection to localhost with the default port
      db = Mongo::Connection.new.db('hbbnext-idm2_development')

      # collections
      faces = db.collection('face')

      # new item
      new_face = { :xuser => xuser_id, :probability => mmi_face, :created_at => now }

      # insert
      face_id = faces.insert(new_face)

      # Normalize
      # Get all xuser values first
      norm = Array.new
      all_faces = faces.find(:xuser => xuser_id).each do |slice|
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
      all_faces = faces.find(:xuser => xuser_id).each do |slice|
       if(slice["created_at"] < now - range)
          faces.remove(slice)
         end
      end

      # Create index for xuser and probability
      faces.create_index("xuser")
      faces.create_index("probability")
    end

    def normalize_voice
      logger.info "Normalizing Voice..."

      # config variables
      range = $normalizationInterval
      now = Time.now.to_i
      debug = true

      # test variables
      xuser_id = @user.id
      mmi_voice = @user.mmi_voice.to_i
      logger.info "xuser ID: #{xuser_id} - MMI value: #{mmi_voice}" if debug

      #  db connection to localhost with the default port
      db = Mongo::Connection.new.db('hbbnext-idm2_development')

      # collections
      voices = db.collection('voice')

      # new item
      new_voice = { :xuser => xuser_id, :probability => mmi_voice, :created_at => now }

      # insert
      voice_id = voices.insert(new_voice)

      # Normalize
      # Get all xuser values first
      norm = Array.new
      all_voices = voices.find(:xuser => xuser_id).each do |slice|
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
      all_voices = voices.find(:xuser => xuser_id).each do |slice|
       if(slice["created_at"] < now - range)
          voices.remove(slice)
         end
      end

      # Create index for xuser and probability
      voices.create_index("xuser")
      voices.create_index("probability")
    end
end
