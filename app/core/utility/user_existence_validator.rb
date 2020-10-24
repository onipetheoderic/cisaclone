module Utility
  class UserExistenceValidator < Rectify::Query

    def initialize(user_id)
      @user_id = user_id
    end

    def query
      User.find_by_id(user_id)
    end

    attr_reader :user_id

  end

end
