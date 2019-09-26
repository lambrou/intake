get '/sessions/new' do
  if session[:user_id]
    @user = User.find(session[:user_id])
    redirect "/users/#{@user.id}"
  else
    redirect '/'
  end
end

post '/sessions/new' do
  @user = User.find_by_email(params[:email])
  if @user && @user.authenticate(params[:password_plaintext])
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    session.delete(:user_id)
    @errors = ["Login Failed", "Please check your email address and password and try again."]
    redirect '/'
  end
end

get '/logout' do
  session.delete(:user_id)
  redirect '/'
end
