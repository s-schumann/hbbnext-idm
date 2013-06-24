class ContextsController < ApplicationController

  before_filter :authorize, only: [:new, :create, :edit, :update, :destroy]

  # GET /contexts
  def index
    @contexts = Context.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /contexts/1
  def show
    @context = Context.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @context }
    end
  end

  # GET /contexts/new
  def new
    @context = Context.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /contexts/1/edit
  def edit
    @context = Context.find(params[:id])
  end

  # POST /contexts
  def create
    @context = Context.new(params[:context])

    require 'securerandom'
    @context.uuid = SecureRandom.uuid

    @context.created_by = current_consumer.email

    respond_to do |format|
      if @context.save
        set_cr_name
        format.html { redirect_to @context, notice: 'Context was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /contexts/1
  def update
    @context = Context.find(params[:id])

    respond_to do |format|
      if @context.update_attributes(params[:context])
        if not @context.created_by
          @context.created_by = current_consumer.email
        end
        set_cr_name
        format.html { redirect_to @context, notice: 'Context was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /contexts/1
  def destroy
    @context = Context.find(params[:id])
    @context.destroy

    respond_to do |format|
      format.html { redirect_to contexts_url }
    end
  end

  # GET /contexts/1/active
  def active
    @context = Context.find(params[:context_id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  private
    def set_cr_name
      @context.crs.each do |cr|
        @context.attributes = {
          :crs_attributes => [
            { :id => cr.id, :name => "#{@context.display_name}:#{@context.udrs.find(cr.udr_id).name}" }
          ]
        }
        if not cr.uuid
          cr.uuid = SecureRandom.uuid
        end
        if not cr.active
          cr.active = false
        end
        if not cr.created_by
          cr.created_by = current_consumer.email
        end
      end
      @context.update_attributes(params[:context])
    end
end
