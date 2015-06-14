class SessionsController < ApplicationController
  def new
    @error
  end

  def create
    @user = User.where(email: params[:session][:email].downcase).first
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      redirect_to '/terminals'
    else
      # Create an error message.
      @error = 'Invalid email/password combination.'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  def fbcreate
    user = User.from_omniauth(env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to '/terminals'
  end
end
