class ApplicationMailer < ActionMailer::Base
  default from: Settings.mailers.default_from
  layout 'mailer'
end
