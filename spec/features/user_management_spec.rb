require 'helpers/general'

feature 'User signs up' do

	before(:each) { allow(Mailer).to receive(:send_message)	}

	scenario 'while being logged out' do
		expect(Mailer).to receive(:send_message)
		sign_up('test', 'test', 'test@test.com', '1234', '1234')
		expect(page).to have_content('Welcome, test')
		expect(User.count).to eq(1)
		expect(user.name).to eq('test')
	end

	scenario 'with another users username' do
		sign_up('test', 'test', 'test@test.com', '1234', '1234')
		sign_up('test2', 'test', 'test2@test.com', '1234', '1234')
		expect(page).to have_content('This username is already taken')
	end

	scenario 'with another users email' do
		sign_up('test2', 'test', 'test@test.com', '1234', '1234')
		sign_up('test2', 'test2', 'test@test.com', '1234', '1234')
		expect(page).to have_content('This email is already taken')
	end

	scenario 'with passwords that do not match' do
		sign_up('test2', 'test2', 'test@test.com', '1234', 'Not 1234')
		expect(page).to have_content('Sorry your passwords do not match')
	end

end

feature 'User signs in' do

	before(:each) { create_test_user; visit ('/') }

	scenario 'with correct credentials' do
		expect(page).not_to have_content('Welcome, test')
		sign_in_test_user
		expect(page).to have_content('Welcome, test')
	end

	scenario 'with incorrect credentials' do
		sign_in('test', 'wrong password')
		expect(page).to have_content('Invalid credentials')
	end

end

feature 'Users signs out' do
	
	before(:each) { create_test_user }

	scenario 'while being logged in' do
		sign_in_test_user
		click_on 'Sign Out'
		expect(page).to have_content('Goodbye')
		expect(page).not_to have_content('Welcome, test')
	end

end

feature 'User forgets their password' do
	 
	before(:each) { create_test_user }

	scenario 'requesting a password reset' do
		expect(user.password_token && user.password_token_timestamp).to be nil
		expect(Mailer).to receive(:send_message)
		request_password_reset_for('test')
		expect(user.password_token && user.password_token_timestamp).not_to be nil
		expect(page).to have_content('Password reset, please check your email')
	end

	scenario 'requesting a reset with incorrect username' do
		expect(Mailer).not_to receive(:send_message)
		request_password_reset_for('not a user')
		expect(page).to have_content('Your username was not recognised')
	end

	scenario 'resetting the password' do
		user.update(:password_token => 'test', :password_token_timestamp => Time.now)
		set_new_password('test')
		expect(User.authenticate('test', 'new')).not_to be nil
	end

	scenario 'trying to reset the password with an invalid token' do
		user.update(:password_token => "test", :password_token_timestamp => Time.now)
		visit '/users/reset_password/not_the_right_token'
		expect(page).to have_content("Invalid Token")
	end

end
