get '/' do
  # render home page
 #TODO: Show all users if user is signed in
  @users = User.all
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do

  # render sign-in page
  erb :sign_in
end

post '/sessions' do
  # sign-in
  user = User.authenticate(params[:email], params[:password])
  if user == nil
    redirect '/sessions/new'
  else
    session[:user_id] = user.id
    redirect '/'
  end
end

delete '/sessions/:id' do
  # sign-out -- invoked via AJAX
  session[:user_id] = nil
end

#----------- USERS -----------

get '/users/new' do
  # render sign-up page
  erb :sign_up
end

post '/users' do
  # sign-up a new user
  user_params = params[:user]
  user = User.new(user_params)
  user.password = user_params[:password]
  user.save

  session[:user_id] = user.id
  redirect '/'
end
