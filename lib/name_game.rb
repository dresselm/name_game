require 'json'
require 'awesome_print'

class NameGame

  FILE_NAME = 'baby_name_battle.txt'

  FIRST_NAMES  = [:Colette]
  MIDDLE_NAMES = [:Aden,
                  :Aiden,
                  :Berta,
                  :Brynn,
                  :Eliza,
                  :Evieve,
                  :Firenza,
                  :Freida,
                  :Frieda,
                  :Lucca,
                  :Pelletier,
                  :Seraphina,
                  :Simone,
                  :Suzanne,
                  :Teresa,
                  :Terese,
                  :Trudi,
                  :Vella,
                  :Vincenza]
  LAST_NAME    = :Dressel

  FIRST_AND_MIDDLE = Struct.new(:first_name, :middle_name)

  def initialize
    @results = build_results
  end

  def battle
    loop do
      name1, name2 = next_pair

      puts "Pick the winner:"
      puts "(1) #{name1}"
      puts "(2) #{name2}"
      puts "or (3) for next"

      input_num = gets.chomp.to_i

      case input_num
      when 1
        update_results(name1, name2)
      when 2
        update_results(name2, name1)
      end

      serialize
    end
  end

  def standings
    ap sort_results(deserialize)
  end

  private

  def build_results
    deserialize || initialize_results
  end

  def initialize_results
    results = {}
    all_full_names.each do |name|
      results[name] = {'win' => 0, 'loss' => 0}
    end
    results
  end

  def all_full_names
    @all_full_names ||= begin
      all_full_names = []
      FIRST_NAMES.each do |first_name|
        MIDDLE_NAMES.each do |middle_name|
          all_full_names << full_name(FIRST_AND_MIDDLE.new(first_name, middle_name))
        end
      end
      all_full_names
    end
  end

  def update_results(winner, loser)
    @results[winner]['win'] += 1
    @results[loser]['loss'] += 1
  end

  def random_name
    full_name(FIRST_AND_MIDDLE.new(randomize_first_name, randomize_middle_name))
  end

  def randomize_first_name
    FIRST_NAMES.sample
  end

  def randomize_middle_name
    MIDDLE_NAMES.sample
  end

  def next_pair
    [random_name, random_name]
  end

  def full_name(name)
    "#{name.first_name} #{name.middle_name} #{LAST_NAME}"
  end

  def serialize
    File.open(FILE_NAME, 'w') do |f|
      f.write(@results.to_json)
    end
  end

  def deserialize
    results = nil
    if File.exists?(FILE_NAME)
      File.open(FILE_NAME, 'r') do |f|
        results = JSON.load(f.read)
      end
    end
    results
  end

  def sort_results(results)
    results.sort_by { |key,record| record['loss'] - record['win'] }
  end
end

class Main

  def self.run
    puts '(1) Battle or (2) see the standings?'

    name_game = NameGame.new

    mode = gets.chomp.to_i
    case mode
    when 1
      name_game.battle
    when 2
      name_game.standings
    else
      puts "I did not understand your selection: #{mode}"
    end
  end

end

