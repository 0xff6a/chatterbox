class Hoot

	include DataMapper::Resource

	belongs_to :user
	has n, :reply
	has n, :users, :through => :reply

	property 	:id, 				Serial
	property 	:content, 	Text, :required => true, 
															:message => 'Your hoot must have content'
	property 	:timestamp, String

end