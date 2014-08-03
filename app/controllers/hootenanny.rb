get '/users/hoots' do
	@hoots = current_user.hoots
	@replies = replies.all
	erb :'users/hoots'
end