# Run daily with Heroku Scheduler:  $ rake clean_ahoy
task clean_ahoy: :environment do
  Ahoy::Visit.clean
end

# Run daily with Heroku Scheduler:  $ rake deliver_daily
task deliver_daily: :environment do
  ReportMailer.daily.deliver_now
end
