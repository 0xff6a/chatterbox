get '/sessions/new' do
	erb :'sessions/new'
end

post '/sessions' do
	user = User.authenticate(params[:username], params[:password])
	user ? create_session_for(user) : session_error
end

delete '/sessions' do
	destroy_session
	redirect to('/')
end

def create_session_for(user)
	session[:user_id] = user.id
	redirect to('/')
end

def session_error
	flash[:errors] = ['Invalid credentials']
	erb :'sessions/new'
end

def destroy_session
	session[:user_id] = nil
	flash[:notice] = 'Goodbye'
end