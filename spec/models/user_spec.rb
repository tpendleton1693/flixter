require 'rails_helper'

describe User do
  describe "instance methods" do
    subject { described_class.new }

    describe "User#enrolled_in?" do
      let(:course) { Course.new }
      context "when the user is not enrolled in a course" do
	it "returns false" do
	  expect(subject.enrolled_in?(course)).to be false
	end
      end

      context "when the user is enrolled in a course" do
	before do
	  subject.enrolled_courses << course
	end

	it "returns true" do
	  expect(subject.enrolled_in?(course)).to be true
	end
      end
    end
  end
end

