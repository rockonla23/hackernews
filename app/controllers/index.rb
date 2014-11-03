enable :sessions


def login?
  if session[:username].nil?
    return false
  else
    return true
  end
end

def username
  return session[:username]
end


get '/' do
  # Look in app/views/index.erb
  @all_post = Post.all
  erb :'/posts/all_posts'
end


get '/users/create' do

  erb :'/users/create_user'
end


post '/users/create_user' do
  @user = User.create(name: params[:name], username: params[:username], email:params[:email], password: params[:password])

  erb :'/users/create_user_success'
end


get '/posts/new' do

end


get '/users/login' do
  erb :'/users/login'
end


post '/users/login' do

  @user = User.authenticate(params[:email], params[:password])
   if @user
     session[:username] = @user[:username]
     redirect '/'
   else
     erb :'/users/invalid'
   end

end

get '/logout' do
  session[:username] = nil
  redirect "/"
end
