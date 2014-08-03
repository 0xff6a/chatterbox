helpers do
	
	def create_hoot(content)
		Hoot.create(:content => content, 
								:timestamp 	=> Time.now,
								:user_id		=> current_user.id)
	end

	def create_reply(hoot, content)
		Reply.create(	:hoot => hoot, 
									:user => current_user,
									:content => content,
									:timestamp => Time.now)
	end

end