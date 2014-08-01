def create_test_user
	User.create(:username => 'test',
							:name => 'test name',
							:email => 'test@test.com',
							:password => 'password',
							:password_confirmation => 'password')
end

def user
	User.first
end