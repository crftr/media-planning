class ClientsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @clients = current_user.clients
  end

  def new
    @form = MPLAN::Creators::ClientCreator.new
  end

  def create
    @form = MPLAN::Creators::ClientCreator.new(
      params[:mplan_creators_client_creator].merge(user: current_user))
    if @form.save
      flash[:success] = "Added #{@form.client_name} as a Client"
      redirect_to :back
    else
      render :edit
    end
  end
end
