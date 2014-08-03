class Reply

	include DataMapper::Resource

	belongs_to :user
	belongs_to :hoot

	property :id, 			Serial
	property :content, 	Text, 	:required => true, 
															:message => 'You must hoot em back with something'
	property 	:timestamp, String
	
end