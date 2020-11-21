require 'open-uri'
require 'nokogiri'
require 'pry'
require_relative '../lib/player.rb'
require_relative '../lib/team.rb'
require_relative '../lib/position.rb'
require_relative '../lib/NFLRosterController.rb'

class Scraper

    def self.scrape_all_teams
        doc = Nokogiri::HTML(open('https://www.nfl.com/teams/'))
        scraped_teams = []
        doc.css('div.d3-o-media-object').each do |team|
            name = team.css('div.d3-o-media-object__body p').text
            url = team.css('div.d3-o-media-object__cta a').attribute("href").text
            Team.new(name, url)
        end
        scrape_each_team
    end

    def self.scrape_each_team
        Team.all.each do |team|
            scraped_players = []
            individual_players = []
            complete_url = "https://www.nfl.com#{team.url}/roster"
            doc = Nokogiri::HTML(open(complete_url))
            tbody = doc.css('div.d3-o-table--horizontal-scroll tbody')
            tbody.css('tr').each do |player|
                individual_players << player
            end
            individual_players.each do |player|
                position_name = player.css('td:nth-child(3)').text
                if !Position.position_names.include?(position_name)
                    position_object = Position.new(position_name)
                else
                    Position.all.select {|position| position_object = position if position.name == position_name}
                end             
                scraped_players << {
                    :name => player.css('a').text.upcase,
                    :team => team,
                    :number => player.css('td:nth-child(2)').text,
                    :position => position_object,
                    :status => player.css('td:nth-child(4)').text,
                    :height => player.css('td:nth-child(5)').text,
                    :weight => player.css('td:nth-child(6)').text,
                    :exp => player.css('td:nth-child(7)').text,
                    :college => player.css('td:nth-child(8)').text 
                }
            end
            create_players(scraped_players)
        end
    end

    def self.create_players(player_array)
        player_array.each do |player|
            Player.new(player)
        end
    end

end

