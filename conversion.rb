class RomanConverter
  CONVERSION_TABLE = {
    'I' => 1,
    'IV' => 4,  
    'V' => 5,
    'IX' => 9,  
    'X' => 10,
    'XL' => 40,  
    'L' => 50,
    'XC' => 90,  
    'C' => 100,
    'CD' => 400,  
    'D' => 500,
    'CM' => 900,  
    'M' => 1000
  }

  def self.roman_to_integer(roman)
    result = 0
    prev_value = 0

    # Ітерація через римські символи у зворотньому порядку
    roman.reverse.each_char do |char|
      if CONVERSION_TABLE[char]
        value = CONVERSION_TABLE[char]
        if value < prev_value
          result -= value
        else
          result += value
        end
        prev_value = value
      else
        puts "Invalid character in the Roman numeral:: #{char}"
        return nil
      end
    end

    result
  end

  def self.integer_to_roman(num)
    result = ''

    # Ітерація через таблицю конвертації у спадаючому порядку
    CONVERSION_TABLE.keys.reverse_each do |key|
      while num >= CONVERSION_TABLE[key]
        result += key
        num -= CONVERSION_TABLE[key]
      end
    end

    result
  end
end

#Клієнтський код
def main
  puts 'Please choose one of the options:'
  puts '1. Convert Roman numerals to integers.'
  puts '2. Convert integers to Roman numerals.'
  choice = gets.chomp.to_i

  case choice
  when 1
    puts 'Enter a Roman numeral to convert to an integer:'
    roman_input = gets.chomp
    integer_result = RomanConverter.roman_to_integer(roman_input)
    if integer_result
      puts "Conversion result: #{integer_result}"
    else
      puts 'Unable to convert an invalid Roman numeral.'
    end
  when 2
    puts 'Enter an integer to convert to Roman numerals:'
    integer_input = gets.chomp.to_i
    roman_result = RomanConverter.integer_to_roman(integer_input)
    puts "Conversion result: #{roman_result}"
  else
    puts 'Invalid option choice.'
  end
end

main
