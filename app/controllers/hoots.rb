get '/hoots/new' do
	erb :'hoots/new'
end

post '/hoots' do
	hoot = create_hoot(params[:content])
	redirect to('/') if hoot.save
	flash.now[:errors] = hoot.errors.full_messages
	erb :'hoots/new'
end

post '/hoots/reply' do
	@hoot = Hoot.first(:id => params[:hoot_id])
	@replies = @hoot.replies.all
	erb :'hoots/reply'
end

post '/hoots/reply/new' do
	hoot = Hoot.first(:id => params[:hoot_id])
	reply = Reply.create(	:hoot => hoot, 
												:user => current_user,
												:content => params[:content],
												:timestamp => Time.now)
	if reply.save
		flash[:notice] ='You joined the Hootenany'
		redirect to('/users/hoots')
	else
		flash[:errors] = reply.errors.full_messages
		erb :'hoots/new'
	end
end

