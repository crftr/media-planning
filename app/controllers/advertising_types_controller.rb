class AdvertisingTypesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @advertising_types = current_user.advertising_types
  end

  def new
    @form = MPLAN::Creators::AdvertisingTypeCreator.new(
      choices_for_media_type: current_user.media_types)
  end

  def create
    @form = MPLAN::Creators::AdvertisingTypeCreator.new(
      params[:mplan_creators_advertising_type_creator].merge(user: current_user))
    if @form.save
      flash[:success] = "Added #{@form.name_of_type} as an Advertising Type"
      redirect_to :back
    else
      render :edit
    end
  end
end
