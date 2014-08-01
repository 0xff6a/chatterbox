class Hoot

	include DataMapper::Resource

	property 	:id, 				Serial
	property 	:content, 	Text, :required => true, 
															:message => 'Your hoot must have content'
	property 	:timestamp, String

end