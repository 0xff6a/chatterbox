get '/users/hoots' do
	@hoots = current_user.hoots.all(:order => [ :timestamp.desc ])
	@replies = Reply.all
	erb :'users/hoots'
end