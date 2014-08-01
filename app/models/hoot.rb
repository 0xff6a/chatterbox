class Hoot

	include DataMapper::Resource

	belongs_to :user

	property 	:id, 				Serial
	property 	:content, 	Text, :required => true, 
															:message => 'Your hoot must have content'
	property 	:timestamp, String

end