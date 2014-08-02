get '/users/new' do
	@user = User.new
	erb :'users/new'
end

post '/users' do
	@user = User.create(:name => params[:name],
											:username => params[:username],
											:email => params[:email],
											:password => params[:password],
											:password_confirmation => params[:password_confirmation])
	if @user.save
		onboard(@user)
	else
		retry_signup_for(@user)
	end
end

get '/users/forgotten_password' do
	erb :'users/forgotten_password'
end

post '/users/reset_password' do
	user = User.first(:username => params[:username])
	if user
		save_token_for(user)
		send_password_reset_message_to(user)
		flash[:notice] =['Password reset, please check your email']
		redirect to('/')
	else
		flash[:errors] = ['Your username was not recognised']
		erb :'users/forgotten_password'
	end
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