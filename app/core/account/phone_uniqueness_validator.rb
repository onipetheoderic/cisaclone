module Account
  class PhoneUniquenessValidator < Rectify::Query
    def initialize(phone)
      @phone = phone
    end

    def query
      Member.find_by_phone(:phone)
    end

    private
    attr_reader :phone
  end

end
