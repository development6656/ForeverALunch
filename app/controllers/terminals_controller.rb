class TerminalsController < ApplicationController

  def index
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
        # puts x.name if convert_time(x.start_time) < convert_time(DateTime.parse(params[:start_time])) && convert_time(x.end_time) > convert_time(DateTime.parse(params[:end_time]))
        puts "*" * 80
        if convert_time(x.start_time) < convert_time(DateTime.parse(params[:start_time])) && convert_time(x.end_time) > convert_time(DateTime.parse(params[:end_time]))
          @business_obj <<
          {
            "name" => x.name,
            "description" => x.description,
            "image" => x.image
          }
        end
      end
     p "*" * 80
    render json: @businesses.to_json

  end

  def swag
  @biz = Business.all
    @abv = Time.now
    @abv = @abv.to_s.scan(/..:..:../)
    p Time.now
    p "*" * 80

    # p Time.now > @biz[3].start_time


    # @zzz = @biz[3].start_time.to_s.scan(/..:..:../).first
    # p @zzz
    # @zyzz = @biz[3].end_time.to_s.scan(/..:..:../).first
    # p @biz[3]
    # @abv = @abv[0]
  end

end
