class SLOTMACHINE
    

    def slot_machine1 #sm1 
        puts <<-'EOF'
        a@@@@@@@@a  a@@@@@@a  a@@@@@@@a a@@@@@@@@a a@@a.  .a@@a  a@@a 
        @@@@  @@@@ @@@@  @@@@ @@@@  @@@ @@@@@@@@@@ @@@@a  a@@@@  @@@@ 
        @@@@  @@@@ @@@@  @@@@ @@@@  @@@    @@@@    `@@@@  @@@@'  @@@@ 
        @@@@@@@@@@ @@@@@@@@@@ @@@@@@@@'    @@@@      `@@@@@@'    @@@@ 
        @@@@@@@@@' @@@@@@@@@@ @@@@@@@@a    @@@@        @@@@      `@@' 
        @@@@       @@@@  @@@@ @@@@ @@@@    @@@@        @@@@ 
        @@@@       @@@@  @@@@ @@@@ @@@@    @@@@        @@@@       @@                      
        EOF
        puts
        puts "Lets Party it up!!"
        puts 'each play is $10 would you like to play [y/n]'
        sm1_play = gets
        case sm1_play
        when 'y'
        play_sm1
        else
        play_sm1
        end
    
    end   
        def play_sm1
            sm1_num_gen1 = rand(1..3)
            sm1_num_gen2 = rand(1..3)
            sm1_num_gen3 = rand(1..3)
            puts
            puts 'Match any 3 items'
            puts
            puts "      [#{sm1_num_gen1}]       [#{sm1_num_gen2}]       [#{sm1_num_gen3}]       "
            puts
            if @wallet <= 11
                puts
                puts "***   NOT ENOUGH FUNDS    ***"
                puts "Win money in other games & come back"
                puts
                menu
            elsif sm1_num_gen1 == sm1_num_gen2 && sm1_num_gen1 == sm1_num_gen3
                sm1_win = @wallet * 3
               puts  "you win $#{sm1_win}!"
                @wallet_amt + sm1_win
                puts "New wallet $#{@wallet_amt}"
               slot_machine1
            else
                @wallet_amt = @wallet - 10
                puts  "You lost $10!"
                puts "New wallet $#{@wallet}"
                slot_machine1
            end        
        end


end