class ConsumersController < ApplicationController
  def new
    @consumer = Consumer.new
  end
  
  def create
    @consumer = Consumer.new(params[:consumer])
    if @consumer.save
      session[:consumer_id] = @consumer.id
      redirect_to root_url, notice: "Thank you for signing up!"
    else
      render "new"
    end
  end
end
