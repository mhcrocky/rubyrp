# Preview all emails at http://localhost:3000/rails/mailers/report
class ReportPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/report/daily
  def daily
    ReportMailer.daily
  end

end
