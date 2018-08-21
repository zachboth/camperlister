require "rails_helper"

describe "User Abilities" do

  let(:user) { create(:user) }
  let(:ability) { Ability.new(user) }

  # admin has all abilities
  context "admin" do

    before do
      user.stubs(:admin?).returns true
      @object = user
    end

    include_examples "has restful abilities", RESTFUL_ACTIONS
  end

  context "non admin" do
    context "for their own account" do
      before do
        user.stubs(:admin?).returns false
        @object = user
      end

      include_examples "has restful abilities", %i[show edit update destroy]
    end

    context "for other users" do
      before do
        @object = create :user
      end

      include_examples "has no abilities"
    end
  end
end
