require "test_helper"

describe SessionsController do
  it "gets new" do
    get :new
    must_respond_with :success
  end

  it "creates a session" do
    user = OmniAuth.config.mock_auth[:identity]
    request.env["omniauth.auth"] = user
    post :create, provider: :identity
    found_user = User.find_by(uid: user.uid)
    cookies[:auth_token].must_equal found_user.auth_token
    must_respond_with :redirect
  end

  it "destroys a session" do
    user = Factory(:user)
    sign_in user
    delete :destroy
    cookies[:auth_token].must_be_nil
    must_respond_with :redirect
  end
end
