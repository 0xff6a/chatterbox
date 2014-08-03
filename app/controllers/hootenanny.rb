get '/users/hoots' do
	@hoots = current_user.hoots
	@replies = Reply.all
	erb :'users/hoots'
end