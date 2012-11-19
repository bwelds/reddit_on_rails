require 'test_helper'

class LinkCreateTest < ActionDispatch::IntegrationTest

	test "logged in user submits valid links" do
		
		user = User.create(:username => "#{Time.now.to_f}", :email => "#{Time.now.to_f}@example.com", :password => "password")
		visit new_user_session_path
		assert_equal '/users/sign_in', current_path

		fill_in 'user_login', :with => user.email
		fill_in 'user_password', :with => 'password'
		click_button 'Sign in'
		refute_equal new_user_session_path, current_path

		visit new_link_path
		title = "Random Title: #{Time.now.to_f}"
		fill_in 'link_title', :with => title
		fill_in 'link_url', :with => 'http://schneems.com'
		click_button 'Create Link'
		link = Link.last
		assert_equal link_path(link), current_path
		assert has_content?(link.title)
		assert has_content?(link.url)

	end


end