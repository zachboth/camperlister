# Functioning example until we decide what mailers we need
class ExampleMailer < ApplicationMailer

  def sample_email(user)
    @user = user
    # change to:
    mail(to: Settings.mailers.default_to, subject: "Sample Email")
  end
end
