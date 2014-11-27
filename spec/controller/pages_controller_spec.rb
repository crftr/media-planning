require 'rails_helper'

describe PagesController, type: :controller do
  describe "GET #index" do
  	before { get :index }
    it { expect(response).to render_template(:index) }
  end
end
