# require "nfl/roster/version"
# require "./lib/player.rb"
# require "./lib/team.rb"

class Position

    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name.upcase
        @players = []
        save
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def self.create(name)
        Position.new(name)
    end

    def players
        @players
    end

    def add_player(player)
        if player.position == nil
            player.position = self
        end
        if !@players.include?(player)
            @players << player
        end
    end

    def self.position_names
        position_name_array = []
        self.all.each {|position| position_name_array << position.name.upcase}
        return position_name_array
    end


end
