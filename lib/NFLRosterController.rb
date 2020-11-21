class NFLRosterController

    def initialize()
    end

    def call
        puts ""
        puts "Welcome to the NFL roster library!"
        puts "------------------------------------------"
        puts "-> To get a list of commands, type 'help'."
        puts "-> To exit at *ANYTIME*, type 'exit'."
        puts "------------------------------------------"
        user_input = ''
        until user_input == 'exit'
            puts ""
            puts "What would you like to do?"
            user_input = gets.chomp
            if user_input == 'help'
                help
            elsif user_input == 'list roster'
                list_roster
            elsif user_input == 'list player'
                list_player
            elsif user_input == 'list position'
                list_position
            elsif user_input == 'list number'
                list_number
            elsif user_input == 'exit'
                puts "Exiting..."
            else
                puts "--ERROR-- Try again!"
            end
        end
    end
            

    def help
        puts ''
        puts "-> To list a team's roster, type 'list roster'."
        puts "-> To find more about a player, type 'list player'."
        puts "-> To find all players from a certain position, type 'list position'."
        puts "-> To find all players with a certain jersey number, type 'list number'."
    end

    def list_number
        puts ""
        puts "What number would you like to get a complete player list for?"
        user_input = gets.chomp
        list_of_players = Player.all.select {|player| player.number == user_input}
        puts "All players for number ##{user_input}:"
        list_of_players.each_with_index do |player, indx|
            puts "#{indx + 1}. #{player.name}"
        end
    end

    def list_player
        puts ""
        puts "What player would you like to get more information for?"
        user_input = gets.chomp
        user_input = user_input.upcase    
        if Player.all_names.include?(user_input)
            player_object = {}
            Player.all.each {|player| player_object = player if player.name == user_input}
            puts ''
            puts "-> If you want to know #{user_input}'s team, type 'team'."
            puts "-> If you want to know #{user_input}'s position, type 'position'."
            puts "-> If you want to know #{user_input}'s jersey number, type 'number'."
            puts "-> If you want to know #{user_input}'s listed height, type 'height'."
            puts "-> If you want to know #{user_input}'s listed weight, type 'weight'."
            puts "-> If you want to know #{user_input}'s tenure in the league, type 'experience'."
            puts "-> If you want to know #{user_input}'s alma-mater, type 'college'."
            puts "-> If you want to know #{user_input}'s current roster status, type 'status'."
            second_user_input = ''
            until second_user_input == 'exit'
                puts ''
                puts "What would you like to know about #{user_input}?"
                second_user_input = gets.chomp
                second_user_input = second_user_input.downcase
                if second_user_input == 'number'
                    puts ''
                    puts "#{user_input}'s number: #{player_object.number}"
                elsif second_user_input == 'position'
                    puts ''
                    puts "#{user_input}'s position: #{player_object.position.name}"
                elsif second_user_input == 'team'
                    puts ''
                    puts "#{user_input}'s team: #{player_object.team.name}"
                elsif second_user_input == 'height'
                    puts ''
                    puts "#{user_input}'s height: #{player_object.height}'"
                elsif second_user_input == 'weight'
                    puts ''
                    puts "#{user_input}'s weight: #{player_object.weight}'"
                elsif second_user_input == 'experience'
                    puts 'yes'
                    puts "#{user_input}'s experience: #{player_object.experience} years"
                elsif second_user_input == 'college'
                    puts ''
                    puts "#{user_input}'s alma-mater: #{player_object.college}"
                elsif second_user_input == 'status'
                    puts ''
                    if player_object.status == 'ACT'
                        puts "#{user_input}'s current roster status is: ACTIVE"
                    elsif player_object.status == 'DEV'
                        puts "#{user_input}'s current roster status is: NOT-ACTIVE"
                    else
                        puts "#{user_input}'s current roster status is: RESERVES-LIST"
                    end
                elsif second_user_input == 'exit'
                    puts 'Exiting...'
                else
                    puts "--ERROR-- Try again!"
                end
            end
        else
            puts "--ERROR-- Invalid Player Name!"
        end
    end

    def list_roster
        puts ""
        puts "Which team would you like a complete roster of?"
        sorted_teams = Team.all.sort_by {|obj| obj.name}
        puts "1. '#{sorted_teams[0].name}' 2. '#{sorted_teams[1].name}' 3. '#{sorted_teams[2].name}' 4. '#{sorted_teams[3].name}' 5. '#{sorted_teams[4].name}' 6. '#{sorted_teams[5].name}' 7. '#{sorted_teams[6].name}' 8. '#{sorted_teams[7].name}'"
        puts "9. '#{sorted_teams[8].name}' 10. '#{sorted_teams[9].name}' 11. '#{sorted_teams[10].name}' 12. '#{sorted_teams[11].name}' 13. '#{sorted_teams[12].name}' 14. '#{sorted_teams[13].name}' 15. '#{sorted_teams[14].name}' 16. '#{sorted_teams[15].name}'"
        puts "17. '#{sorted_teams[16].name}' 18. '#{sorted_teams[17].name}' 19. '#{sorted_teams[18].name}' 20. '#{sorted_teams[19].name} 21. '#{sorted_teams[20].name}' 22. '#{sorted_teams[21].name}' 23. '#{sorted_teams[22].name}' 24. '#{sorted_teams[23].name}'"
        puts "25. '#{sorted_teams[24].name}' 26. '#{sorted_teams[25].name}' 27. '#{sorted_teams[26].name}' 28. '#{sorted_teams[27].name} 29. '#{sorted_teams[28].name}' 30.  '#{sorted_teams[29].name}' 31. '#{sorted_teams[30].name}' 32. '#{sorted_teams[31].name}''"
        user_input = gets.chomp
        user_input = user_input.upcase
        if Team.team_names.include?(user_input)
            my_team = Team.return_team(user_input)
            puts ''
            puts "Complete roster for #{user_input}:"
            puts ''
            counter = 1
            # puts Player.all
            my_team.players.each do |player|
                if player.team.name == user_input 
                    puts "#{counter}. #{player.name.upcase} ##{player.number} POS: '#{player.position.name.upcase}' TEAM: '#{player.team.name.upcase}'"
                    counter += 1
                end
            end
        else
            puts "--ERROR-- Invalid Team Name!"
        end
    end

    def list_position
        puts ""
        puts "Which position would you like a complete player list of?"
        puts "-> Positions include: 'QB, RB, WR, OT, OG, OLB, MLB, DT, LB, DE, CB, FS, SS, C, TE, K, P"
        user_input = gets.chomp
        user_input = user_input.upcase
        if Position.position_names.include?(user_input)
            puts ''
            puts "Complete roster for the #{user_input.capitalize} position:"
            puts ''
            counter = 1
            sorted_players = Player.all.sort_by {|obj| obj.name}  
            sorted_players.each do |player|
                if player.position.name == user_input
                    puts "#{counter}. #{player.name.upcase} ##{player.number} POS: '#{player.position.name.upcase}' TEAM: '#{player.team.name.upcase}'" 
                    counter += 1
                end
            end   
        end             
    end
end

