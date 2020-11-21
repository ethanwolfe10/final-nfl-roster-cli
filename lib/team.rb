# require "nfl/roster/version"
# require "./lib/player.rb"
# require "./lib/position.rb"

class Team

    attr_accessor :name, :url, :players
    @@all = []

    def initialize(name,  url)
        @name = name.upcase
        @url = url
        @players = []
        save
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def players
        @players
    end

    def self.team_names
        team_name_array = []
        self.all.each {|team| team_name_array << team.name.upcase}
        return team_name_array
    end

    def self.return_team(name)
        team_arr = self.all.select {|team| team.name == name}
        if team_arr.size == 0
            return nil
        else
            return team_arr[0]
        end
    end


    def add_player(player)
        if player.team == nil
            player.team = self
        end
        if !@players.include?(player)
            @players << player
        end
    end
end


