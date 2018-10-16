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
    @today = Date.today
    @day = @today - 6
    7.times do
      @messes = Messy.where(created_at: @day.all_day)
      @c = @messes.count
      @sum = 0
      @messes.each do |m|
        @sum += m.mess
      end
      if @c == 0 then
        data = 0
      else
        data = @sum / @c
        end
      gon.data << data
      @day += 1
    end
  end
end