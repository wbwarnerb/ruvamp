require_relative 'Vampire'
class Simulation
  @@day = 0
  def start_sim(vampire_pop, human_pop)
    until vampire_pop <= 0 || human_pop <= 0 do
      v = Vampire.new(vampire_pop, human_pop)
      hours_of_day = *(1..24)
      hours_of_day.each { |h|
        puts "Day: #{@@day} Hour: #{h}"
        v_result = v.feed_times(h)
        vampire_pop = v_result[0]
        human_pop = v_result[1]
        puts "Vampires: #{vampire_pop} Humans: #{human_pop}"
        @@day += 1 if h == 24
      }
    end
  end
end