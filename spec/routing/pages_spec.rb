require 'rails_helper'

describe 'routing to pages' do
  it { expect(get: root_path).to route_to(controller: 'pages', action: 'index') }
end
