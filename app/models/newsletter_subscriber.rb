class NewsletterSubscriber < ApplicationRecord
  validates_uniqueness_of :email
end
