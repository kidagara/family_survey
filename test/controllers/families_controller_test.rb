require "test_helper"

describe FamiliesController do
  let(:family) { Factory :family }
  let(:user) { Factory :user }

  before do
    sign_in user
  end

  describe "with a user" do
    it "gets index" do
      get :index
      must_respond_with :success
    end

    it "renders new on error" do
        -> {
          post :create, family: { family_name: '' }
        }.wont_change 'Family.count'
        assigns(:family).wont_be_nil
        must_render_template :new
      end

    it "gets edit" do
      get :edit, id: family.id
      must_respond_with :success
    end

    it "update a family" do
      patch :update, id: family, family: { family_name: 'spy' }
      family.reload
      flash[:notice].wont_be_nil
      family.family_name.must_equal 'spy'
    end

    it "renders edit on error" do
        patch :update, id: family, family: { family_name: '' }
        family.reload
        family.family_name.must_equal family.family_name
        assigns(:family).wont_be_nil
        must_render_template :edit
      end

    it "delete a family" do
      family = Factory(:family)
      -> {
        delete :destroy, id: family.id
      }.must_change 'Family.count', -1
      must_respond_with :redirect
    end
  end

end
