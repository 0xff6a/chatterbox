get '/sessions/new' do
	erb :'sessions/new'
end

post '/sessions' do
	user = User.authenticate(params[:username], params[:password])
	if user
		session[:user_id] = user.id
		redirect to('/')
	else
		flash[:errors] = ['Invalid credentials']
		erb :'sessions/new'
	end
end