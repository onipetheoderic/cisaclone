module Account
  class SignUpForm < Rectify::Form
    mimic :user

    attribute :firstname,                   String
    attribute :lastname,                    String
    attribute :phone,                       String
    attribute :email,                       String
    attribute :password,                    String
    attribute :password_confirmation,       String

    validates :firstname, :lastname, :presence => true
    validates :email, :presence => true, :email => true

    validates :password,
      :length => { :in => 8..32},
      :confirmation  => true,
      :presence => true 

    validate :validate_email_uniqueness

    def validate_email_uniqueness
      return if EmailUniquenessValidator.new(email).none?
      errors.add(:email,'already in use')
    end

  end
end
