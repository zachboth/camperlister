require "rails_helper"

describe Listing do
  let(:datetime) { DateTime.new }
  let(:user) { create :user }
  subject { create :listing, user_id: user.id }

  context "#soft_delete" do
    before do
      DateTime.stubs(:now).returns datetime
    end

    it "updates deleted_at" do
      subject.soft_delete
      expect(subject.reload.deleted_at).to eq datetime
    end

    it "does NOT delete the record" do
      subject
      expect { subject.soft_delete }.to_not change{ Listing.all.count }
    end
  end
end
