get '/users/hoots' do
	@hoots = current_user.hoots
	@replies = current_user.replies
	erb :'users/hoots'
end