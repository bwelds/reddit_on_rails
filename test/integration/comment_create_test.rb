require 'test_helper'

class CommentCreateTest < ActionDispatch::IntegrationTest

	test "logged in user submits valid comment" do
		
		user = User.create(:username => "#{Time.now.to_f}", :email => "#{Time.now.to_f}@example.com", :password => "password")
		visit new_user_session_path
		assert_equal '/users/sign_in', current_path

		fill_in 'user_login', :with => user.email
		fill_in 'user_password', :with => 'password'
		click_button 'Sign in'
		refute_equal new_user_session_path, current_path

		link = Link.create(:title => "Home of Schneems", :url => "http://www.schneems.com", :user_id => "1")
		# click_link('comments')
		# save_and_open_page
		# assert_equal link_path(link), current_path

		# message = "Test comment #{Time.now.to_f}"
		# fill_in 'comment_message', :with => message

		# click_button 'Create Comment'
		# assert_equal link_path(link), current_path
	end


end