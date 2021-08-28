require "rails_helper"

RSpec.describe ReportMailer, type: :mailer do
  describe "daily" do
    let(:mail) { ReportMailer.daily }

    # it "renders the body" do
    #   expect(mail.body.encoded).to include("Report#daily")
    # end
  end

end
