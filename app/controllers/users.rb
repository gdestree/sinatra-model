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
  @questions = Question.all
  erb :'users/show'
end

