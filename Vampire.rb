class Vampire
  # attr_accessor :vampire_pop
  # vampire_gestation = {}

  def initialize(vampire_pop,human_pop)
    @vampire_pop = vampire_pop
    @human_pop = human_pop
  end

  def feed_times(hour)
    if @vampire_pop != 0 && @human_pop != 0
      puts "Vampire pop: #{@vampire_pop}"
      individual_vampire = *(1..@vampire_pop)
      individual_vampire.each {
        attack_human(20,-3) if hour > 18 || hour < 6
      }
    end
    return @vampire_pop, @human_pop
  end

  def attack_human(v_modifier,h_modifier)
    if @human_pop != 0 && @vampire_pop != 0
      vampire_chances = rand(1..100) + v_modifier
      human_defense = rand(1..100) + h_modifier
      if vampire_chances > human_defense
        @vampire_pop += 1
        @human_pop -= 1
      else
        x = rand(1..3)
        @vampire_pop -= x
      end
    end
  end
end