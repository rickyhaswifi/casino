require_relative 'random_events'

@garage = [
    {car: 'Honda', model: 'Civic', year: 1987}
]  



def outside_menu
  puts
    if @current_guest == nil
      @people[0][:wallet] = @wallet
    else
      @people[@current_guest - 1][:wallet] = @wallet
    end
    puts
    puts <<-'EOF'
         
      ******** **  **                         ********                 
      **////// //  /**                        /**/////                  
     /**        ** /** **    **  *****  ******/**        ******  **   **
     /*********/** /**/**   /** **///**//**//*/*******  **////**//** ** 
     ////////**/** /**//** /** /******* /** / /**////  /**   /** //***  
            /**/** /** //****  /**////  /**   /**      /**   /**  **/** 
      ******** /** ***  //**   //******/***   /**      //******  ** //**
     ////////  // ///    //     ////// ///    //        //////  //   // 
      
                     
    EOF
                                                        
    puts "1) Go back inside"
    puts "2) View Garage"
    puts "3) Leave"
    outside_menu_options
    
end


def  outside_menu_options
  outside_input = gets.strip.to_i
  case outside_input
  when 1
    return_casino
  when 2
    view_garage
  else
    puts "Security can\'t understand what your slurring & kicked you out"
    exit
  end
end


def return_casino
  puts 'Good evening, I just started my shift, please check in'
  puts 'Check in with the number next to your name or hit enter if its your first time'
  @people.size.times do |i|
    puts "#{i + 1}) Guest Name: #{@people[i][:name]}"
  end
  separator
  return_casino_menu
end   

def return_casino_menu
  guest_log = gets.strip
  if guest_log == guest_log.to_i.to_s
    guest_log = guest_log.to_i
    if guest_log == 1
      @current_guest = 1
      @wallet = @people[guest_log - 1][:wallet]
      @name = @people[guest_log - 1][:name]
      puts "Welcome #{@people[guest_log-1][:name]}" 
      printf("Wallet $%.2f\n", @people[guest_log - 1][:wallet])
      menu
    elsif guest_log <= @people.length && guest_log > 0
      @current_guest = guest_log
      @wallet = @people[guest_log - 1][:wallet]
      @name = @people[guest_log - 1][:name]
      puts "Welcome #{@people[guest_log-1][:name]}" 
      printf("Wallet $%.2f\n", @people[guest_log - 1][:wallet])
      menu
    else
      puts "Select one of the names from the list, or hit enter if it's your first time here!"
      return_casino_menu
    end
  elsif guest_log.strip == ''
    @current_guest = @people.length + 1
    greeting
  else
    puts "What was that? Speak louder!"
    return_casino_menu
  end  
end

def view_garage
    puts "Your garage"
    @garage.size.times do |i|
        puts "#{i + 1}) Car: #{@garage[i][:car]}"
        puts "Model: #{@garage[i][:model]}"
        puts "Year: #{@garage[i][:year]}"
        random_event_1
    end
    outside_menu
end