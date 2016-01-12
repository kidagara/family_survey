require 'test_helper'

describe UserPolicy do
  let(:user) { Factory :user, first_name: 'George', last_name: 'Lucas' }

  describe "for authorized user" do

    let(:admin) { Factory :user, first_name: 'Stephen', last_name: 'Spielberg' }

    before do
      admin.add_role :admin
    end

    it "permits index" do
      :user.must_permit admin, :index
    end

    it "permits show" do
      user.must_permit admin, :show
    end

    it "permits new" do
      user.must_permit admin, :new
    end

    it "permits create" do
      user.must_permit admin, :create
    end

    it "permits edit" do
      user.must_permit admin, :edit
    end

    it "permits update" do
      user.must_permit admin, :update
    end

    it "permits destroy" do
      user.must_permit admin, :destroy
    end

  end

  describe "for unauthorized user" do
    it "prohibits index" do
      :user.wont_permit user, :index
    end

    it "permits show of current user" do
      user.must_permit user, :show
    end

    it "prohibits new" do
      user.wont_permit user, :new
    end

    it "prohibits create" do
      user.wont_permit user, :create
    end

    it "permits edit of current user" do
      user.must_permit user, :edit
    end

    it "permits update of current user" do
      user.must_permit user, :update
    end

    it "prohibits destroy" do
      user.wont_permit user, :destroy
    end
  end
end
