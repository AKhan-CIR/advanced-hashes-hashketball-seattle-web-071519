require 'pry'

def game_hash
  {
  :home => { :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => [
      {:player_name => "Alan Anderson",
      :number => 0,
      :shoe => 16,
      :points => 22,
      :rebounds => 12,
      :assists => 12,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 1
      },
      {
      :player_name => "Reggie Evans",
      :number => 30,
      :shoe => 14,
      :points => 12,
      :rebounds => 12,
      :assists => 12,
      :steals => 12,
      :blocks => 12,
      :slam_dunks => 7
      },
      {
      :player_name => "Brook Lopez",
      :number => 11,
      :shoe => 17,
      :points => 17,
      :rebounds => 19,
      :assists => 10,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 15
      },
      {
      :player_name => "Mason Plumlee",
      :number => 1,
      :shoe => 19,
      :points => 26,
      :rebounds => 11,
      :assists => 6,
      :steals => 3,
      :blocks => 8,
      :slam_dunks => 5
      },
      {
      :player_name => "Jason Terry",
      :number => 31,
      :shoe => 15,
      :points => 19,
      :rebounds => 2,
      :assists => 2,
      :steals => 4,
      :blocks => 11,
      :slam_dunks => 1
      }
    ]
  },
  :away => {:team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players => [
      {:player_name => "Jeff Adrien",
      :number => 4,
      :shoe => 18,
      :points => 10,
      :rebounds => 1,
      :assists => 1,
      :steals => 2,
      :blocks => 7,
      :slam_dunks => 2
      },
      {
      :player_name => "Bismack Biyombo", 
      :number => 0,
      :shoe => 16,
      :points => 12,
      :rebounds => 4,
      :assists => 7,
      :steals => 22,
      :blocks => 15,
      :slam_dunks => 10
      },
      {
      :player_name => "DeSagna Diop", 
      :number => 2,
      :shoe => 14,
      :points => 24,
      :rebounds => 12,
      :assists => 12,
      :steals => 4,
      :blocks => 5,
      :slam_dunks => 5
      },
      {
      :player_name => "Ben Gordon",
      :number => 8,
      :shoe => 15,
      :points => 33,
      :rebounds => 3,
      :assists => 2,
      :steals => 1,
      :blocks => 1,
      :slam_dunks => 0
      },
      {
      :player_name => "Kemba Walker",
      :number => 33,
      :shoe => 15,
      :points => 6,
      :rebounds => 12,
      :assists => 12,
      :steals => 7,
      :blocks => 5,
      :slam_dunks => 12
      }
    ]
  }
}
end

def num_points_scored(arg) #need parameter here
  game_hash.each do |side,team| #go down one level to get to key/value pairs of next hash
    team.each do |innerkey, innervalue| #go down to next level to reach players hash
      if innerkey == :players #iterate until you reach players
      innervalue.each do |player| #seperate each(ha) player
       if player[:player_name] == arg #compare seperated player[key] with parameter
          return player[:points] #return points, must use seperated player again or you just get [:points]  return***
          end
        end
      end
    end
  end
end

def shoe_size(arg)  #same as above
  game_hash.each do |side,team|
    team.each do |innerkey, innervalue|
      if innerkey == :players
      innervalue.each do |player|
       if player[:player_name] == arg
          return player[:shoe] #just changed to [:shoe]
         end
        end
      end
    end
  end
end



def team_colors(arg)
     
  game_hash.each do |side,team| #going down one level from home/away to get key/values of teams
    if team[:team_name] == arg #down one level to get key/value for colors
      return team[:colors] #return value #return color for only 1 team
     end
  end
end


def team_names #no parameter because we are working on entire hash
    game_hash.map do |side, team| #going down one level from home/away to get values of teams
       team[:team_name] #we used map so array is already made, just add values can you use collect? what about each?
      end
    end
 
#define func(arg)
#go down one level to get team data (map)
#go down another level to get player data for each teamS
#return :number for all players in new array (map)
 
# def player_numbers (arg)
#   arr  = []
#   game_hash.each do |side,team|
#     if team[:team_name] == arg
#       team.each do |innerkey, innervalue|
#       if innerkey == :players
#       innervalue.each do |player|
#         arr.push(player[:number])
       
#       end
#     end
#   end
# end
# end
# arr
# end
 
def player_numbers (arg)
  arr = []
    game_hash.each do |side,team|
    if team[:team_name] == arg
      team.each do |innerkey, innervalue|
      if innerkey == :players
      innervalue.each do |player|
        player.each do |number,value|
        if number == :number
          arr.push(value)
          
              end
            end
          end
        end
      end
    end
  end
arr
end
 
 
def player_stats(arg)
    game_hash.each do |side,team|
    team.each do |innerkey,innervalue|
    if innerkey == :players
    innervalue.each do |player|
    if player[:player_name] == arg
    return player.reject! { |key| key == :player_name }
                end     
            end
        end
      end
    end
  end

  def big_shoe_rebounds
  big_shoe = 0
  total_rebounds = 0
  
    game_hash.each do | side, team|
      team[:players].each do |stats|
        if stats[:shoe] > big_shoe
          big_shoe = stats[:shoe]
          total_rebounds = stats[:rebounds]
        end
      end
    end
  total_rebounds
end


def most_points_scored
  most_points = 0 
 name = ""
  
  game_hash.each do |side, team|
    team[:players].each do |stats|
      if stats[:points] > most_points
        most_points = stats[:points]
        name = stats[:player_name]
end
end
end
name
end


describe '#winning_team' do

    it 'returns the Brooklyn Nets' do
      expect(winning_team).to eq("Brooklyn Nets")
    end

  end

  describe '#player_with_longest_name' do

    it 'returns Bismack Biyombo' do
      expect(player_with_longest_name).to eq("Bismack Biyombo")
    end

  end

end

describe 'super bonus' do

  describe '#long_name_steals_a_ton?' do

    it 'returns true' do
      expect(long_name_steals_a_ton?).to eq(true)
    end

  end

end


        

