module Account
  class SignInForm < Rectify::Form
    mimic :user

    attribute :email,     String
    attribute :password,  String

    validates :password, :presence => true, length: {in: 8..32}
    validates :email, :presence => true, :email => true

  end

end
