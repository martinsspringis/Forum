module StatsHelper
  def min_per_game(min, sec, games)
  	average = (min * 60 + sec)/games.to_f
  	average/60
  end

  def shooting_percentage(made, attempted)
  	if attempted > 0
  	  number_to_percentage((made.to_f/attempted) * 100, precision: 2)

  	else 0.0
  	end 
  end
end