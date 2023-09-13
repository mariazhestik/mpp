conditions = {
  :Rock => :Scissors,
  :Paper => :Rock,
  :Scissors => :Paper
}

if ARGV.empty?
  puts "Please enter your human (Rock, Paper, Scissors):"
  human = gets.chomp.capitalize.to_sym
else
  human = ARGV[0].capitalize.to_sym
end

computer = conditions.keys.sample


if conditions[human] == computer
  puts "You won!"
elsif computer == human
  puts "It's a draw."
elsif conditions[computer] == human
  puts "You lost."
else
  puts "#{human} is not a valid option"
end