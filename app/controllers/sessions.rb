get '/login' do
  erb :'users/login'
end

post '/login' do
  user = User.find_by(email: params[:email])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect '/'
  else
    @errors = ["Email or Password incorrect. Please try again."]
    erb :"/users/login"
  end
end

get '/logout' do
  session.clear
  redirect '/'
end
