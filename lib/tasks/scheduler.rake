# Run daily with Heroku Scheduler:  $ Ahoy::Visit.clean
task clean_ahoy: :environment do
  Ahoy::Visit.clean
end

# Run daily with Heroku Scheduler:  $ Ahoy::Visit.daily_report
task deliver_daily: :environment do
  ReportMailer.daily.deliver_now
end
