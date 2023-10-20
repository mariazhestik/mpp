def sort_numbers(numbers, order)
  if order == "asc"
    sorted_numbers = numbers.sort { |a, b| a <=> b }
  elsif order == "desc"
    sorted_numbers = numbers.sort { |a, b| b <=> a }
  else
    puts "Invalid sorting order. Please choose 'asc' for ascending or 'desc' for descending."
    return
  end

  puts "Sorted numbers in #{order}ending order: #{sorted_numbers.join(', ')}"
end

def main
  puts "Enter a list of numbers separated by spaces:"
  input = gets.chomp
  numbers = input.split.map(&:to_i)

  if numbers.empty?
    puts "Please enter at least one number."
  else
    puts "Enter 'asc' for ascending order or 'desc' for descending order:"
    order = gets.chomp.downcase
    sort_numbers(numbers, order)
  end
end

main

