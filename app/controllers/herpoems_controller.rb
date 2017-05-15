class HerpoemsController < ApplicationController
  def index
    @herpoems = Poem.all
  end

  def show
    @herpoem = Poem.find(params[:id])
  end
end
