class TerminalsController < ApplicationController

  def view
    @terminal = Terminal.where(id: params[:id]).first
  end

end
