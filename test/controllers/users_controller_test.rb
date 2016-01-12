require 'test_helper'

describe UsersController do
  let(:user) { Factory :user }

  before do
    sign_in user
  end

  describe "with an authorized user" do
    before do
      user.add_role :admin
    end

    it "gets index" do
      get :index
      must_respond_with :success
    end

    it "gets show" do
      get :show, id: user
      must_respond_with :success
    end

    it "gets edit" do
      get :edit, id: user
      must_respond_with :success
    end

    it "updates a user" do
      patch :update, id: user, user: { first_name: 'Zoey' }
      user.reload
      user.first_name.must_equal 'Zoey'
      flash[:notice].wont_be_nil
      must_redirect_to users_path
    end

    it "deletes a user" do
      user = Factory(:user)
      -> {
        delete :destroy, id: user
      }.must_change 'User.count', -1
      must_redirect_to users_path
    end
  end

  describe "with an unauthorized user" do
    it "doesn't get index" do
      get :index
      must_respond_with :redirect
    end

    it "doesn't get other user show" do
      get :show, id: user
      must_respond_with :success
    end

    it "gets edit if user" do
      get :edit, id: user
      must_respond_with :success
    end

    it "doesn't update a user" do
      patch :update, id: user, user: { name: 'spy' }
      must_respond_with :redirect
      user.name.wont_equal 'spy'
    end

    it "doesn't delete a user" do
      user = Factory(:user)
      -> {
        delete :destroy, id: user
      }.wont_change 'User.count'
      must_respond_with :redirect
    end
  end
end
