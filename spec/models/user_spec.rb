# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  username               :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  name                   :string(255)      default(""), not null
#  organization           :string(255)      default(""), not null
#  email                  :string(255)      default(""), not null
#  admin                  :boolean          default(FALSE), not null
#  client_manager         :boolean          default(FALSE), not null
#  created_at             :datetime
#  updated_at             :datetime
#

require 'rails_helper'

describe User, type: :model do
  let!(:name) { 'Jonny McRotton' }
  let!(:email) { 'jmr@badguy.com' }
  let!(:username) { 'badbadbad' }
  let!(:params) { { name: name, email: email, username: username } }
  let(:user) { User.new(params) }

  describe 'validation' do
    it { expect(user.valid?).to be_truthy }
    it { expect(user).to validate_presence_of(:name) }
    it { expect(user).to validate_presence_of(:email) }
    it { expect(user).to validate_presence_of(:username) }
    it { expect(user).to validate_uniqueness_of(:email) }
    it { expect(user).to validate_uniqueness_of(:username) }

    describe 'username formats' do
      it { expect(user).to allow_value('mixMasterMike').for(:username) }
      it { expect(user).to allow_value('bro-brah').for(:username) }
      it { expect(user).to allow_value('m3shuggah').for(:username) }

      it { expect(user).to_not allow_value('3mike').for(:username) }
      it { expect(user).to_not allow_value('m.herrera').for(:username) }
    end
  end

  describe '#to_param' do
    let(:param_user) { FactoryGirl.create(:user) }
    it { expect(param_user.to_param).to eq(param_user.username) }
  end
end
