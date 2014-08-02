helpers do
	
	def create_hoot(content)
		Hoot.create(:content => content, 
								:timestamp 	=> Time.now,
								:user_id		=> current_user.id)
	end

end