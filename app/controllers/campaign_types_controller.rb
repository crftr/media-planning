class CampaignTypesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @campaign_types = current_user.campaign_types
  end

  def new
    @form = MPLAN::Creators::CampaignTypeCreator.new
  end

  def create
    @form = MPLAN::Creators::CampaignTypeCreator.new(
      params[:mplan_creators_campaign_type_creator].merge(user: current_user))
    if @form.save
      flash[:success] = "Added #{@form.name_of_type} as a Campaign Type"
      redirect_to :back
    else
      render :edit
    end
  end
end
