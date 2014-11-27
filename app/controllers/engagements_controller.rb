class EngagementsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @engagements = current_user.engagements
  end

  def new
    @form = MPLAN::Creators::EngagementCreator.new(
      choices_for_client: current_user.clients)
  end

  def create
    @form = MPLAN::Creators::EngagementCreator.new(
      params[:mplan_creators_engagement_creator])
    if @form.save
      flash[:success] = "Added #{@form.engagement_name} as an Engagement"
      redirect_to :back
    else
      render :edit
    end
  end
end
