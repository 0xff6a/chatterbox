class Hoot

	include DataMapper::Resource

	belongs_to :user
	has n, :replies
	has n, :users, :through => :replies

	property 	:id, 				Serial
	property 	:content, 	Text, :required => true, 
															:message => 'You must hoot something'
	property 	:timestamp, String

end