

class Horse_race

  attr_accessor :horses, :track_length, :motivator1, :motivator2
  
  def initialize
    system 'clear'
    @@midpoint_comment_given = false
    @wallet = 250
    @avail_names = ["Seabiscuit", "Secretariat", "Seattle Slew", "Affirmed", "Northern Dancer", "Kincsem", "Black Caviar", "Native Dancer", "Man o'War", "Citation", "Assault", "Count Fleet", "Whirlaway", "War Admiral", "Omaha", "Gallant Fox", "Sir Barton"].shuffle
    @horse1 = Horse.new("1")
    @horse2 = Horse.new("2")
    @horse3 = Horse.new("3")
    @horses = [@horse1, @horse2, @horse3]
    assign_random_names() 
    welcome  
    display_track
    start_race
    race  
    determine_leader
    race_commentary
    determine_winner
    reward
    bet_again
  end

  def assign_random_names
    @horse1.name = @avail_names.pop
    @horse2.name = @avail_names.pop
    @horse3.name = @avail_names.pop
  end

  def prep
    if @wallet < 25 
      puts " "
      puts "***   NOT ENOUGH FUNDS    ***"
      puts "Win money in other games & come back"
    else
      welcome
    end
  end

  def welcome
    puts ""
    puts "========================================"
    puts "### Welcome to the Silver Fox Track ###"
    puts "========================================"
    puts ""
    puts ""
    puts "Once the race begins, try the following commands to motivate your horse."
    puts '["carrot", "hay", "sugar", yah, "apple"]'
    puts ""
    puts "You've selected #{@horse2.name}, in the #2 position."
  end 
 
  def display_track
    @track_length = 40
    @@halfway = @track_length / 2
    puts "=" * @track_length
    puts ("." * @horse1.distance) + @horse1.symbol + (" " * (@track_length + 7 - @horse1.distance)) + @horse1.name
    puts ("." * @horse2.distance) + @horse2.symbol + (" " * (@track_length + 7 - @horse2.distance)) + @horse2.name
    puts ("." * @horse3.distance) + @horse3.symbol + (" " * (@track_length + 7 - @horse3.distance)) + @horse3.name
    puts "=" * @track_length
  end
 
  def start_race
    puts "The horses are at the gate:"
    puts ".........................."
    puts "And they're off!!!"
  end
 
  def race
    until @horse1.distance >= @track_length || @horse2.distance >= @track_length || @horse3.distance >= @track_length
      @horse2.get_user_input
      @horse1.move_horse
      @horse2.move_horse
      @horse3.move_horse
      display_track
      determine_leader
      race_commentary
    end
  end

  def determine_leader
    @positions = []
    @horses.each do |horse|
      @positions << horse
      @positions.sort! { |a, b|; b.distance <=> a.distance }
    end
    @leader = @positions[0].name
  end

  def race_commentary
    gap1 = @positions[0].distance - @positions[1].distance
    gap2 = @positions[0].distance - @positions[2].distance
    case @positions[0].distance
    when 12...17
      if gap1 > 0
        puts "It's #{@leader} with an early lead by #{gap1} lengths"
      elsif gap2 == 0
        puts "The horses are running neck-and-neck!"
      else puts "#{@leader} and #{@positions[1].name} are battling for the early lead."
      end
    when @@halfway .. (@@halfway + 5)
      if @@midpoint_comment_given == true
        puts ""
      else      
        if gap1 == 0 && gap2 == 0
        puts "At the halfway mark it's too close to call - they're running shoulder-to-shoulder!"
        elsif gap1 == 0
          puts "At the midpoint, it's #{@positions[0].name} and #{@positions[1].name} neck-and-neck for the lead!"
        else 
          puts "Halfway to the finish, its #{@leader} ahead by #{gap1} lengths! #{@positions[2].name} is #{gap2} lengths off the lead."
        end
        @@midpoint_comment_given = true
      end 
    when 43..49
      if gap1 > 0
        puts "It's #{@leader} charging toward the finish line, with #{@positions[1].name} #{gap1} lengths behind!"
      else
        puts "#{@leader} and #{@positions[1].name} are in a dead-heat nearing the finish line!"
      end
    end
  end

 
  def determine_winner
    puts "And the winner is..."
    finishers = []
    @horses.each do |horse|
      if horse.distance > @track_length
        finishers << horse
      end
    end
    if finishers.length == 1
      @winner = finishers[0].name
      puts "#{@winner}!"
    # if 2 finishers, which went farthest?
    elsif finishers.length == 2
      puts "It's a photo-finish! The judges will review this..."
      sleep(2)
      @winner = finishers[0].name
      puts "It's " + "#{@winner}" + " by a neck!"
    else #all 3 horses crossed finish line
      puts "It looks like a tie, so let's race again!"
      end
    end
  end
  def reward
    if @winner == @horse2.name
      puts "You won $50.00"
      @wallet = @wallet + 50
      puts "New wallet balance is $#{@wallet}"
    elsif
      @winner != @horse2.name
      puts "You lost $50.00"
      @wallet = @wallet - 50 
      puts "New wallet balance $#{@wallet}" 
      bet_again
    end
  end
  def bet_again
    puts "Would you like to bet again? (y/n)"
    bet_again = gets.strip
    case bet_again
    when 'y'
    Horse_race.new
    else
    menu
  end
end

class Horse
  attr_reader :acceleration, :top_speed, :endurance, :motivated, :speed, :distance, :symbol, :motivator1, :motivator2
  attr_accessor :name
  
  def initialize(sym)   
    @name = ""
    @acceleration = rand(1..2)
    @top_speed = rand(4..5)
    @endurance = rand(34..44)
    @motivated = 0
    @speed = 0
    @distance = 0
    @symbol = sym
    @motivator1 = generate_horse_motivator
    @motivator2 = generate_horse_motivator
  end 
  
  def generate_horse_motivator
    motivators = ["carrot", "yah", "hay", "sugar", "apple"]
    @motivator1 = motivators.sample
    target = motivators.index(@motivator1)
    motivators.delete_at(target)
    @motivator2 = motivators.sample
  end
 
  def get_user_input
    puts ""
    puts "Encourage your horse:['carrot', 'yah', 'hay', 'sugar', 'apple']?"
    @attempted_motive = gets.chomp.downcase
    if @attempted_motive == @motivator1 || @attempted_motive == @motivator2
      @motivated = 1
      @horse_responses = ["#{@name} is responding well to his rider!", "#{@name} and jockey look like they understand each other perfectly.", "#{@name} is giving it everything its got!", "#{@name} is really in sync with his jockey!" ]
      puts @horse_responses.sample
    else
      @motivated = 0
    end
  end
 
  def move_horse    
      @speed += (@motivated + @acceleration)
      if @speed > @top_speed
        @speed = @top_speed
      end
 
      bonus_move = rand(1..9)
      if bonus_move == 9 && distance == 0
        puts "#{@name} explodes out of the gate!"
        @speed += 2
      elsif bonus_move == 9 && distance > 1
        if @horse1
          puts "And #{@name} is making a move on the inside rail!"
        elsif @horse3
          puts "#{@name} surges forward on the outside."
        end
        @speed += 2
      elsif bonus_move == 8 && distance >= 40
        puts "#{@name} is making a dramatic charge toward the finish line!"
        @speed += 2
      end
 
      @distance_prelim = (@distance + @speed)
      if @distance_prelim > @endurance
        @speed -= 1
        @speed += @motivated
        @distance += @speed
      else
        @distance += @speed
      end
    end
  end

  