class TerminalsController < ApplicationController

  def index
  end

  def show
  end

  def create
    @terminal = Terminal.where(name: params[:terminal]).first
    # @businesses = Business.where(terminal_id: params[:terminal])
    p params

    xyz = convert_time(DateTime.parse(params[:start_time]))
    p DateTime.parse(params[:end_time])
      @businesses = @terminal.businesses
      @business_obj = []

      # @businesses = @terminal.businesses.where(start_time < params[:start_time])
      @businesses.each do |x|

        puts "*" * 80
        if convert_time(x.start_time) < convert_time(DateTime.parse(params[:start_time])) && convert_time(x.end_time) > convert_time(DateTime.parse(params[:end_time]))
          @business_obj <<
          {"name" => x.name,
            "description" => x.description,
            "image" => x.image,
            "id" => x.id
          }
        end
      end
     p "*" * 80
    render json: @businesses.to_json

  end



end
