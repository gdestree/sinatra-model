get '/users' do
  @users = User.all
  erb :'users/index'
end

get '/users/new' do
  erb :'users/register'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session["user_id"] = @user.id
    redirect "/login"
  else
    @errors = @user.errors.full_messages
    erb :"users/register"
  end
end

get '/users/:id' do
  @user = User.find_by(id: params[:id])
  erb :'users/show'
end

get '/users/:id/edit' do
  @user = User.find_by(id: params[:id])

  if current_user.id == @user.id
    erb :'/users/edit'
  else
    erb :'/users/errors'
  end
end

put '/users/:id' do
  @user.assign_attributes(params[:user])

  if @user.save
    redirect "users/#{@user.id}"
  else
    @errors = @user.errors.full_messages
    erb :'users/edit'
  end
end
