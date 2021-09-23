class ReportMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.report_mailer.daily.subject

  # Daily analytics email
  # Run daily with Heroku Scheduler:  $ ReportMailer.daily.deliver_now
  def daily
    # @user = ENV["GMAIL_USERNAME"]
    @user = User.with_role(:sysadmin)
                .pluck(:email)

    @visits = Ahoy::Visit.daily
                         .order(:started_at, id: :asc)

    mail to: @user
  end

end
