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