module Active
  class UdrsController < ApplicationController

    # GET /contexts/1/active/udrs
    def index
      @context = Context.find(params[:context_id])
    end

    # GET /contexts/1/active/udrs/2
    def show
      head :forbidden
    end

    # POST /contexts/1/active/udrs
    def create
      set_last_login
      head :forbidden
    end

    # PUT /contexts/1/active/udrs/2
    def update
      set_last_login
      head :forbidden
    end

    # DELETE /contexts/1/active/udrs/2
    def destroy
      head :forbidden
    end
  end

  private
    def set_last_login
    @context.crs.each do |cr|
      @context.attributes = {
        :crs_attributes => [
          { :id => cr.id, :name => "#{@context.display_name}:#{@context.udrs.find(cr.udr_id).name}" }
        ]
      }
      if cr.active
        cr.last_login = Time.now
      end
    end
    @context.update_attributes(params[:context])
  end
end
