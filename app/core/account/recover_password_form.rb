module Account
  class RecoverPasswordForm < Rectify::Form

    attribute :email, String

    validates :email, :presence => true, :email => true

  end

end
