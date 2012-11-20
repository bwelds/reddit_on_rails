require 'test_helper'

class SearchTest < ActionDispatch::IntegrationTest

	test "search for item in database works" do
		
		user = User.create(:username => "#{Time.now.to_f}", :email => "#{Time.now.to_f}@example.com", :password => "password")
		visit new_user_session_path
		assert_equal '/users/sign_in', current_path

		fill_in 'user_login', :with => user.email
		fill_in 'user_password', :with => 'password'
		click_button 'Sign in'
		refute_equal new_user_session_path, current_path

		visit root_path
		assert_equal root_path, current_path

		link = Link.create(:title => "Home of Schneems", :url => "http://www.schneems.com", :user_id => "1")
		fill_in 'q', :with => 'schneems'
		click_button 'Search'
		assert_equal search_path, current_path
		assert_equal page.has_content?('schneems'), true

	end

	test "search for item not in database works" do
		
		user = User.create(:username => "#{Time.now.to_f}", :email => "#{Time.now.to_f}@example.com", :password => "password")
		visit new_user_session_path
		assert_equal '/users/sign_in', current_path

		fill_in 'user_login', :with => user.email
		fill_in 'user_password', :with => 'password'
		click_button 'Sign in'
		refute_equal new_user_session_path, current_path

		visit root_path
		assert_equal root_path, current_path

		link = Link.create(:title => "Home of Schneems", :url => "http://www.schneems.com", :user_id => "1")
		fill_in 'q', :with => 'magic'
		click_button 'Search'
		assert_equal search_path, current_path
		assert_equal page.has_content?('no links'), true

	end
end