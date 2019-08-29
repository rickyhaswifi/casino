def entertainment_menu

  puts 'Where would you like to go?'
  puts '1) Casino Mueseum'
  puts '2) Silver Fox Arena'
  ent_choice = gets.to_i

  case ent_choice 
  when 1
  puts "Welcome to the Silver Fox Casino Mueseum"
  puts <<-'EOF'
    ┌────────────────────────────────┐
    |                                |
    |   _._     _,-'""`-._           |
    |   (,-.`._,'(       |\`-/|      |
    |       `-.-' \ )-`( , o o)      |
    |             `-    \`_`"'-      |               
    |                                |
    └────────────────────────────────┘
  EOF
  puts "Photo of the Silver Fox"
  random_event_2

  when  2
  system ('say "The Boys in the hood are always hard"') 
  puts "Live music by the Chezey E Tribute Band"
  puts
  else
  menu
  end

  separator
  menu
end