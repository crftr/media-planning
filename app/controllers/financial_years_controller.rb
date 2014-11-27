class FinancialYearsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @financial_years = current_user.financial_years
  end

  def new
    @form = MPLAN::Creators::FinancialYearCreator.new
  end

  def create
    @form = MPLAN::Creators::FinancialYearCreator.new(
      params[:mplan_creators_financial_year_creator].merge(user: current_user))
    if @form.save
      flash[:success] = "Added #{@form.name} as a Financial Year"
      redirect_to :back
    else
      render :edit
    end
  end
end
