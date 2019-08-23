@garage = [
    {car: 'Honda', model: 'Civic', year: 1987}
]  

def outside_menu
    
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
        puts "Wallet $ #{@people[i][:wallet]}"
    end
    puts    
    guest_log = gets.to_i
    if guest_log == 1
       puts "Welcome #{@people[guest_log-1][:name]}" 
       main_game_menu
    else
        greeting
    end  
end


def view_garage
    puts "Your garage"
    @garage.size.times do |i|
        puts "#{i + 1}) Car: #{@garage[i][:car]}"
        puts "Model: #{@garage[i][:model]}"
        puts "Year: #{@garage[i][:year]}"
    end
    outside_menu
end