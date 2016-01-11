require "test_helper"

describe User::Authentication do
  let(:user) { Factory.build :user }

  it "has an auth token" do
    user.must_respond_to :auth_token
  end

  # TODO: Figure out why this test fails even though the code works
  it "generates an auth token before saving" do
    user.save
    found_user = User.find_by(email: user.email)
    found_user.auth_token.wont_be_nil
  end
end
