helpers do

	def create_user(name, username, email, password, password_confirmation)
			User.create(:name 									=> name,
									:username 							=> username,
									:email 									=> email,
									:password 							=> password,
									:password_confirmation 	=> password_confirmation)
	end

	def send_welcome_message_to(user)
		Mailer.send_message(user.email, "Welcome to Chatterbox", 
		"Hey Good Lookin',\n\nWelcome to the Chatterbox. Get hootin'\n\nAll the best,\n\nThe Team")
	end

	def send_password_reset_message_to(user)
		Mailer.send_message(user.email, "Password Reset", 
		"Click here to reset your password:\n http://fast-wave-2933.herokuapp.com/users/reset_password/#{user.password_token}")
	end

	def set_new_password_for(user, new_password, new_password_confirmation)
		user.update(:password 								=> new_password,
								:password_confirmation 		=> new_password_confirmation,
								:password_token 					=> nil,
								:password_token_timestamp => nil)
	end

	def save_token_for(user)
		user.update(:password_token => generate_token, :password_token_timestamp => Time.now)
	end

end
