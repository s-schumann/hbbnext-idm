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
end
