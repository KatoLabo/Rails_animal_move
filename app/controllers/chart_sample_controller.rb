class ChartSampleController < ApplicationController


  def index
    gon.data1 = []
    gon.data2 = []
    @today = Date.today
    @day = @today - 6
    7.times do
      @messes = Messy.where(created_at: @day.all_day)
      @count = @messes.count
      if @count == 0 then
        data1 = 0
        data2 = 0
      else
        @sum_mess = 0
        @sum_total_score = 0
        @messes.each do |m|
          @add_mess = m.mess.to_i
          @sum_mess += @add_mess
          @add_total_score = m.total_score.to_i
          @sum_total_score += @add_total_score
        end
        data1 = @sum_mess / @count
        data2 = @sum_total_score / @count
        end
      gon.data1 << data1
      gon.data2 << data2
      @day += 1
    end
  end
end