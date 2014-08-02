class Hoot

	include DataMapper::Resource

	belongs_to :user
	has n, :reply
	has n, :users, :through => :reply

	property 	:id, 				Serial
	property 	:content, 	Text, :required => true, 
															:message => 'You must hoot something'
	property 	:timestamp, String

end