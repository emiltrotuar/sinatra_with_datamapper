require 'spec_helper'
require_relative '../app'

describe 'App' do
	before :each do
		@user = User.new
	end

	describe User do
		it "adds new user to database when sign up" do
			expect{ @user.save }.to change(User.count).by 1
		end

		it "" do
			expect{ @user.save }.not_to change(User.count)
		end

		it "" do
			
		end

		it "" do
			
		end

		it "" do
			
		end
	end

	describe Session do
		before :each do	
			@session = Session.new
		end
		it "" do
			
		end

		it "" do
			
		end

		it "" do
			
		end

		it "" do
			
		end

		it "" do
			
		end
	end
end