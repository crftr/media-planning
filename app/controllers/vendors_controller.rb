class VendorsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @vendors = current_user.vendors
  end

  def new
    @form = MPLAN::Creators::VendorCreator.new
  end

  def create
    @form = MPLAN::Creators::VendorCreator.new(
      params[:mplan_creators_vendor_creator].merge(user: current_user))
    if @form.save
      flash[:success] = "Added #{@form.vendor_name} as a Vendor"
      redirect_to :back
    else
      render :edit
    end
  end
end
