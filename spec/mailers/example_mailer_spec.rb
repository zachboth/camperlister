require "rails_helper"

describe ExampleMailer do
  context "#sample_email" do
    let(:user) { create(:user) }

    subject { ExampleMailer.sample_email(user) }

    it "sends an email on delivery" do
      subject.deliver_now
      expect(ActionMailer::Base.deliveries).to_not be_empty
    end

    it "delivers to the provided user's email address" do
      expect(subject.to).to eq ["default@to.com"]
    end
  end

end
