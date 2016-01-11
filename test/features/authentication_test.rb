require "test_helper"

feature "Authentication" do
  scenario "the test is sound" do
    visit root_path
    page.must_have_content "Take the survey"
  end

  # scenario "create a new account and log out" do
  #   ActionMailer::Base.deliveries = []
  #   visit sign_in_path
  #   click_link nil, href: new_identity_path
  #   fill_in :first_name, with: "Bob"
  #   fill_in :last_name, with: "Billy"
  #   fill_in :email, with: "bibblybob@bob.com"
  #   fill_in :location, with: "Billy Bob's Emporium"
  #   fill_in :description, with: "Owner, manager and all around good guy"
  #   fill_in :password, with: "cake"
  #   fill_in :password_confirmation, with: "cake"
  #   # making this false allows the feature test for OmniAuth Login to pass
  #   OmniAuth.config.test_mode = false
  #     click_button "Create a new account"
  #   # turn back to true
  #   OmniAuth.config.test_mode = true
  #   last_email = ActionMailer::Base.deliveries.last
  #   last_email.to.must_include "appsupport@wavetronix.com"
  #   page.must_have_content "for creating an account"
  #   click_link nil, href: sign_out_path
  #   page.must_have_content "Sign in"
  # end

end
