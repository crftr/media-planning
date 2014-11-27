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

# Represents the entity who will actually authenticate with this app.
class User < ActiveRecord::Base
  has_many :vendors
  has_many :clients
  has_many :engagements, through: :clients
  has_many :financial_years
  has_many :contracts

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :omniauthable, :registerable,
  # :validatable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable

  validates :name,     presence: true
  validates :email,    presence: true, uniqueness: { case_sensitive: false }
  validates :username, presence: true,
                       uniqueness: { case_sensitive: false },
                       format: { with: /\A[a-zA-Z]+[a-zA-Z\d\-]*\z/,
                                 message: "first character must be a letter, and then letters, numbers, and hyphens are allowed" }

  def advertising_types
    AdvertisingType.includes(:media_type)
      .joins(:media_type)
      .order('media_types.name', :name)
      .where('advertising_types.user_id = :user_id OR advertising_types.global = :true', user_id: id, true: true)
  end

  def campaign_types
    CampaignType.order(:name)
      .where('user_id = :user_id OR global = :true', user_id: id, true: true)
  end

  def media_types
    MediaType.order(:name)
      .where('user_id = :user_id OR global = :true', user_id: id, true: true)
  end

  def to_param
    username
  end
end
