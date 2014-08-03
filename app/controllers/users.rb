SECONDS_IN_5_MIN = 300

get '/users/new' do
	@user = User.new
	erb :'users/new'
end

post '/users' do
	@user = create_user(params[:name],
											params[:username], 
											params[:email],
											params[:password],
											params[:password_confirmation])
	@user.save ? onboard(@user) : retry_signup_for(@user)
end

get '/users/forgotten_password' do
	erb :'users/forgotten_password'
end

post '/users/reset_password' do
	user = User.first(:username => params[:username])
	user ? start_reset_process_for(user) : retry_password_reset
end

get '/users/reset_password/:token' do |token|
	@token = token
	@user = User.first(:password_token => token)
	if @user && token_valid?(@user)
		erb :'users/reset_password' 
	else
		invalid_token_message
	end
end

post '/users/confirm_reset_password' do
	user = User.first(:password_token => params[:token])
	if user && token_valid?(user)
		set_new_password_for(user, params[:new_password], params[:new_password_confirmation])
		valid_token_message
	else
		invalid_token_message
	end
end

def valid_token_message
	flash[:notice] = 'Your password has been reset'
	redirect to('/')
end

def invalid_token_message
	flash[:errors] = ['Invalid Token']
	redirect to('/')
end

def token_valid?(user)
	Time.parse(user.password_token_timestamp) > (Time.now - SECONDS_IN_5_MIN)
end

def start_reset_process_for(user)
	save_token_for(user)
	send_password_reset_message_to(user)
	flash[:notice] ='Password reset, please check your email'
	redirect to('/')
end

def retry_password_reset
	flash[:errors] = ['Your username was not recognised']
	erb :'users/forgotten_password'
end

def onboard(user)
	session[:user_id] = user.id
	send_welcome_message_to(user)
	flash[:notice] = "Welcome, #{user.username}"
	redirect to('/')
end

def retry_signup_for(user)
	flash[:errors] = user.errors.full_messages
	erb :'users/new'
end