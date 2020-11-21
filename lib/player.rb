# require "nfl/roster/version"
# require "./lib/team.rb"
# require "./lib/position.rb"

class Player

    attr_accessor :name, :number, :team, :position, :height, :weight, :college, :experience, :status
    @@all = []

    def initialize(player_hash)
        @name = player_hash[:name]
        @number =  player_hash[:number]
        @height = player_hash[:height]
        @weight = player_hash[:weight]
        @experience = player_hash[:exp]
        @college = player_hash[:college]
        @team = player_hash[:team]
        @position = player_hash[:position]
        @status = player_hash[:status]
        @team.add_player(self)
        @position.add_player(self)
        save
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    # def team=(team_object)
    #     @team = team_object
    #     team_object.add_player(self)
    # end

    # def position=(position_object)
    #     @position = position_object
    #     position_object.add_player(self)
    # end

    def players
        @players
    end

    def self.all_names
        name_array = []
        self.all.each {|player| name_array << player.name}
        return name_array
    end
end
