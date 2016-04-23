require 'rails_helper'

RSpec.describe User, type: :model do
    it "can assign an admin" do
      admin = create(:user, role: 1)
      assert_equal "admin", admin.role
    end

    it "defaults to a user" do
      user = create(:user)
      assert_equal "user", user.role
    end
end
