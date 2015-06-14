class TerminalsController < ApplicationController

  def index
  end
  def create
    @terminal = Terminal.where(name: params[:terminal]).first
  end

end
