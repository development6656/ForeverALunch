class ConnectionController < ApplicationController

  def index
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
