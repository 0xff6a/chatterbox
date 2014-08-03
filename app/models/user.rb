require 'bcrypt'

class User

	include DataMapper::Resource

	attr_reader :password
	attr_accessor :password_confirmation

	validates_confirmation_of :password, :message => 'Sorry your passwords do not match'

	has n, :replies
	has n, :hoots, :through => :replies

	property :id, 											Serial
	property :name, 										Text
	property :username, 								Text, 	:unique => true, 
																							:message => 'This username is already taken'
	property :email, 										Text, 	:format => :email_address, 
																							:message => 'Invalid email format',
																							:unique => true, 
																							:message => 'This email is already taken'
	property :password_digest, 					Text
	property :password_token, 					Text
	property :password_token_timestamp, Text

	def password=(password)
		@password = password
		self.password_digest = BCrypt::Password.create(password)
	end

	def self.authenticate(username, password)
		user = first(:username => username)
		return user if user && BCrypt::Password.new(user.password_digest) == password
		nil
	end

end