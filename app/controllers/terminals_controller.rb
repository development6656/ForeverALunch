class TerminalsController < ApplicationController

  def index
  end

  def show
  end

  def create
    @terminal = Terminal.where(name: params[:terminal]).first
    # @businesses = Business.where(terminal_id: params[:terminal])
    DateTime.parse(params[:end_time])
    @businesses = @terminal.businesses
    @business_obj = []
    # @businesses = @terminal.businesses.where(start_time < params[:start_time])
    @businesses.each do |x|

      # puts x.name if convert_time(x.start_time) < convert_time(DateTime.parse(params[:start_time])) && convert_time(x.end_time) > convert_time(DateTime.parse(params[:end_time]))
      if convert_time(x.start_time) <= convert_time(DateTime.parse(params[:start_time])) && convert_time(x.end_time) >= convert_time(DateTime.parse(params[:end_time]))
        others = []
        x.appointments.each do |appt|
          if convert_time(appt.start_time) <= convert_time(DateTime.parse(params[:start_time])) && convert_time(appt.end_time) >= convert_time(DateTime.parse(params[:end_time]))
            others << User.where(id: appt.user_id).first.profile_picture
          end
        end
        @business_obj <<
        {"name" => x.name,
          "description" => x.description,
          "image" => x.image,
          "id" => x.id,
          "other_users" => others
        }
      end
    end
    render json: @business_obj.to_json

  end



end
