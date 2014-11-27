class MediaTypesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @media_types = current_user.media_types
  end

  def new
    @form = MPLAN::Creators::MediaTypeCreator.new
  end

  def create
    @form = MPLAN::Creators::MediaTypeCreator.new(
      params[:mplan_creators_media_type_creator].merge(user: current_user))
    if @form.save
      flash[:success] = "Added #{@form.name_of_type} as a Media Type"
      redirect_to :back
    else
      render :edit
    end
  end
end
