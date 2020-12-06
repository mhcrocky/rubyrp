require 'rails_helper'

RSpec.feature "HomepageFlows", type: :feature do

  describe "homepage" do
    let!(:user) { FactoryBot.create(:user) }
    context "when the user is anonymous" do
      it "renders a page with a link to the sign up form" do
        visit authenticated_root_path
        expect(page).to have_current_path(root_path)
      end
    end

    describe "log in page" do
      let!(:user) { FactoryBot.create(:user) }
      it "logs the user in and redirects to their dashboard" do
        visit new_user_session_path
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        expect(page).to have_content("Sign in")
        expect(page).to have_current_path(new_user_session_path)
      end
    end

    describe "signing up page" do
      let!(:user) { FactoryBot.create(:user) }
      it "signs the user up and redirects to their dashboard" do
        visit new_user_registration_path
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        expect(page).to have_content("Sign up")
        expect(page).to have_current_path(new_user_registration_path)
      end
    end

    context "when the user is authenticated" do
      it "renders the dashboard" do
        sign_in user
        visit authenticated_root_path
        expect(page).to have_content("Dashboard")
        expect(page).to have_current_path(authenticated_root_path)
      end
    end

  end
end
