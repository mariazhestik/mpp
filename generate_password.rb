require 'securerandom'

def generate_password(length)
  characters = ('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a + ['!', '@', '#', '$']
  password = SecureRandom.hex(length / 2)  
  password.chars.map { |char| characters[char.to_i(16) % characters.length] }.join
end

# Клієнтський код для тестування генерації паролю
print 'Enter the desired password length: '
length = gets.chomp.to_i

if length <= 0
  puts 'Invalid password length. Please enter a positive number.'
else
  password = generate_password(length)
  puts "Generated password: #{password}"
end
