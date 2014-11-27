# Static pages
class PagesController < ApplicationController
  before_filter :authenticate_user!, only: [:experiments]

  def index
    render layout: 'marketing'
  end

  def experiments
    render layout: 'application'
  end
end
