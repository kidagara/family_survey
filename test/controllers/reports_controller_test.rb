require "test_helper"

describe ReportsController do
  let(:family) { Factory :family }
  let(:user) { Factory :user }

  before do
    sign_in user
  end

  describe "who is authorized" do
    before do
      user.add_role :admin
    end

    it "gets index" do
      get :index
      must_respond_with :success
    end
  end

  describe "with an unauthorized user" do
    it "gets index" do
      get :index
      must_respond_with :redirect
    end
  end

end
