class ChartSampleController < ApplicationController
  #def index
    #gon.data = []
    #6.times do |i|
      #data = rand(100.0)
      #gon.data << data
    #end
  #end

  def index
    gon.data = []
    @messes = Mess.all
    @mess_last = Mess.last
    @i = @mess_last.id - 6
    7.times do
      data = Mess.find_by(id: @i).value
      gon.data << data
      @i += 1
    end
  end
end