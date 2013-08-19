helpers do

  def current_user
    user = User.find_by_id(session[:user_id])
  end

  # survey monkey auth
  # def current_user
  #   if session[:name]
  #     return User.find(session[:name])
  #   else
  #     return nil
  #   end
  # end

# below is what we used for flash flood
# def current_user
#     user = User.find_by_id(session[:user_id])
# end

end
