class Reply

	include DataMapper::Resource

	belongs_to :user
	belongs_to :hoot

	property :id, Serial

end