enable :sessions

before do
  if request.fullpath =~ /\/batches\/*/
    unless @current_user = session[:sinatraed_current_user]
      session[:return_to] = request.fullpath
      redirect('/login')
    end
  end
end

get('/login') do
  haml(:login)
end

post('/login') do
  if session[:sinatraed_current_user] = User.login(params['username'], params['password'])
    return_to = session.delete(:return_to) || '/'
    redirect(return_to)
  else
    redirect('/login')
  end
end

get('/logout') do
  session[:current_user] = nil
  redirect('/login')
end
