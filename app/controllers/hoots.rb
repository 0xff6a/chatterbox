get '/hoots/new' do
	erb :'hoots/new'
end

post '/hoots' do
	hoot = create_hoot(params[:content])
	redirect to('/') if hoot.save
	flash.now[:errors] = hoot.errors.full_messages
	erb :'hoots/new'
end

