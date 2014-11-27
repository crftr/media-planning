require 'rails_helper'

describe 'routing to users' do
  let(:user) { FactoryGirl.create(:user) }
  it { expect(get: user_path(user)).to(
    route_to(controller: 'users', action: 'show', id: user.username)) }
end
