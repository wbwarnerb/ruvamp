require_relative 'Vampire'
class Simulation
  @@day = 0
  def start_sim(vampire_pop, human_pop)
    @csv = File.open("results/simulation_results_#{rand(1500..5500)}.csv", "w")
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
        csv_writer(@@day,h,vampire_pop,human_pop)
      }
    end
    @csv.close
  end
  def csv_writer(day, hour, vampire_pop, human_pop)
    @csv << "#{day},#{hour},#{vampire_pop},#{human_pop}\n"
  end
end