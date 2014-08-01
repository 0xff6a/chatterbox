class Hoot

	include DataMapper::Resource

	property 	:id, 				Serial
	property 	:content, 	Text
	property 	:timestamp, String

end