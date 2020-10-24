class User < ApplicationRecord
  extend FriendlyId
  friendly_id :fullname, use: :slugged
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :confirmable, :timeoutable, omniauth_providers: [:facebook]

  has_many :blog_posts, class_name: 'Post', foreign_key: 'owner_id'
  has_many :approved_blog_posts, class_name: 'Post', foreign_key: 'approved_by'
  has_many :campaigns
  has_many :donations
  has_many :programs
  enum role: %i[customer admin]

  validates_presence_of :email, :firstname, :lastname, :phone

  def fullname
    "#{firstname} #{lastname}"
  end

  def to_s
    fullname
  end

  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do | user |
      user.email = provider_data.info.email
      user.role = provider_data.info.role
      user.admin = provider_data.info.admin
      if provider_data.info.firstname && provider_data.info.lastname
        user.firstname = provider_data.info.firstname
        user.lastname = provider_data.info.lastname
      else
        user.firstname = 'complete'
        user.lastname = 'facebook details'
      end
      user.phone = provider_data.info.phone
      user.password = Devise.friendly_token[0, 20]
      user.skip_confirmation!
    end
  end

end
