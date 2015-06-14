class UsersController < ApplicationController
 def new
    @user = User.new
  end

  def create
    @user = User.new(
      username: params[:user][:username],
      email: params[:user][:email],
      password: params[:user][:password]
      )
    p @user
      if params[:user][:password] == params[:user][:password_confirmation]
        @user.save
        log_in(@user)
        redirect_to '/terminals'
      else
        @error = "Password confirmation must match Password"
        render :new
      end
  end

  def appoint
    p params
    appointment = Appointment.new(
        user_id: session[:user_id],
        business_id: params[:id],
        start_time: DateTime.parse(params[:begin_time]),
        end_time: DateTime.parse(params[:end_time]),
        attending: true
      )
    appointment.save!

    render json: appointment.to_json
  end
end

