class DevicesController < ApplicationController

  before_filter :authorize, only: [:new, :create, :edit, :update, :destroy]

  # GET /devices
  def index
    @devices = Device.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /devices/1
  def show
    @device = Device.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /devices/new
  def new
    @device = Device.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /devices/1/edit
  def edit
    @device = Device.find(params[:id])
  end

  # POST /devices
  def create
    @device = Device.new(params[:device])

    require 'securerandom'
    @device.uuid = SecureRandom.uuid

    @device.created_by = current_consumer.email

    respond_to do |format|
      if @device.save
        set_udr_name
        format.html { redirect_to @device, notice: 'Device was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /devices/1
  def update
    @device = Device.find(params[:id])

    respond_to do |format|
      if @device.update_attributes(params[:device])
        if not @device.created_by
          @device.created_by = current_consumer.email
        end
        set_udr_name
        format.html { redirect_to @device, notice: 'Device was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /devices/1
  def destroy
    @device = Device.find(params[:id])
    @device.destroy

    respond_to do |format|
      format.html { redirect_to devices_url }
    end
  end

  private
    def set_udr_name
      @device.udrs.each do |udr|
        @device.attributes = {
          :udrs_attributes => [
            { :id => udr.id,
              :name => "#{@device.users.find(udr.user_id).username}:#{@device.display_name}",
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
      @device.update_attributes(params[:device])
    end
end
