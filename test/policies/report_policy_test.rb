require 'test_helper'

describe ReportPolicy do
  let(:user) { Factory :user, first_name: 'George', last_name: 'Lucas' }

  describe "for authorized user" do

    let(:admin) { Factory :user, first_name: 'Stephen', last_name: 'Spielberg' }

    before do
      admin.add_role :admin
    end

    it "permits index" do
      :user.must_permit admin, :index
    end

  end

  describe "for unauthorized user" do
    it "prohibits index" do
      :user.wont_permit user, :index
    end


  end
end
