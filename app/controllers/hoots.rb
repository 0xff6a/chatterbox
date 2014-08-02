get '/hoots/new' do
	erb :'hoots/new'
end

post '/hoots' do
	hoot = Hoot.create(	:content 		=> params[:content], 
											:timestamp 	=> Time.now,
											:user_id		=> current_user.id)
	redirect to('/') if hoot.save
	flash.now[:errors] = hoot.errors.full_messages
	erb :'hoots/new'
end

