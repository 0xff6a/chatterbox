require_relative 'helpers/general'

describe User do

	it 'can be created' do
		create_test_user
		expect(User.count).to eq(1)
		expect(user.name).to eq('test name')
	end

	it 'password and confirmation must match to create a user' do
		User.create(:username => 'test',
							:name => 'test name',
							:email => 'test@test.com',
							:password => 'password',
							:password_confirmation => 'not password')
		expect(User.count).to eq(0)
	end

	it 'must have a unique email' do
		create_test_user
		User.create(:username => 'test2',
								:name => 'test name2',
								:email => 'test@test.com',
								:password => 'password',
								:password_confirmation => 'password')
		expect(User.count).to eq(1)
	end

	it 'must have a unique username' do
		create_test_user
		User.create(:username => 'test',
								:name => 'test name2',
								:email => 'test2@test.com',
								:password => 'password',
								:password_confirmation => 'password')
		expect(User.count).to eq(1)
	end

	it 'can be authenticated' do
		create_test_user
		expect(User.authenticate('test', 'password')).not_to be nil
		expect(User.authenticate('test', 'not password')).to be nil
	end
	
end