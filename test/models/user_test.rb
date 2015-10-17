require 'test_helper'
require 'minitest/spec'

describe User do
  describe "instance methods" do
    before do
      @user = User.new
    end

    describe "User#enrolled_in?" do
      before do
	@course = Course.new
      end
      describe "when a user is not enrolled in a course" do

	it "returns false" do
	  @user.enrolled_in?(@course).must_equal false
	end
      end

      describe "when a user is enrolled in a course" do
	before do
	  @user.enrolled_courses << @course
	end

	it "returns true" do
	  @user.enrolled_in?(@course).must_equal true
	end
      end
    end
  end
end
