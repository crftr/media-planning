class ContractsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @contracts = current_user.contracts
  end

  def new
    @form = MPLAN::Creators::ContractCreator.new(
      choices_for_campaign_type: current_user.campaign_types,
      choices_for_engagement: current_user.engagements,
      choices_for_financial_year: current_user.financial_years,
      choices_for_vendor: current_user.vendors)
  end

  def create
    @form = MPLAN::Creators::ContractCreator.new(
      params[:mplan_creators_contract_creator].merge(user: current_user))   
    if @form.save
      flash[:success] = "Added #{@form.campaign_name} as a Contract"
      redirect_to :back
    else
      render :edit
    end
  end
end
