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
  sm1_play = gets.strip
  case sm1_play
  when 'y'
  play_sm1
  else
  menu
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
          @wallet = @wallet + 30
         puts  "you win $30!"
          printf("New wallet $%.2f\n", @wallet)
         slot_machine1
      else
          @wallet = @wallet - 10
          puts  "You lost $10!"
          printf("New wallet $%.2f\n", @wallet)
          slot_machine1
      end        
  end
