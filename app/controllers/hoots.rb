get '/hoots/new' do
	erb :'hoots/new'
end

post '/hoots' do
	hoot = create_hoot(params[:content])
	redirect to('/') if hoot.save
	hoot_error(hoot)
end

post '/hoots/reply' do
	@hoot = Hoot.first(:id => params[:hoot_id])
	@replies = @hoot.replies.all
	erb :'hoots/reply'
end

post '/hoots/reply/new' do
	hoot = Hoot.first(:id => params[:hoot_id])
	reply = create_reply(hoot, params[:content])
	reply.save ? process_reply : reply_error(reply)
end

def process_reply
	flash[:notice] ='You joined the Hootenany'
	redirect to('/users/hoots')
end

def hoot_error(bad_hoot)
	flash.now[:errors] = bad_hoot.errors.full_messages
	erb :'hoots/new'
end

def reply_error(bad_reply)
	flash[:errors] = bad_reply.errors.full_messages
	erb :'hoots/new'
end
