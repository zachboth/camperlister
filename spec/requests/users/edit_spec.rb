require "rails_helper"
include Warden::Test::Helpers

describe "Users", type: :request do

  let(:user) { create :user }

  context "edit User" do
    context "authorization" do
      before do
        @admin = create(:user, admin: true)
        @user = create(:user)
        @path = edit_user_path(@user.id)
      end

      include_examples "request authorized for signed-in users"
    end
  end
end
