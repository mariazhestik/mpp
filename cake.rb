# Функція для розрізання пирогу на прямокутні шматочки з родзинками.
def slice_cake(cake, n)
    raisin_count = cake.join.count('o') 
    raisins_per_slice = raisin_count / n 
  
    slices = [] 
    slice = [] 
    remaining_raisins = raisins_per_slice 
  
    # Проходимо через кожен рядок пирога.
    cake.each do |row|
      slice << row 
      remaining_raisins -= row.count('o') 
  
      if remaining_raisins == 0
        slices << slice 
        slice = [] 
        remaining_raisins = raisins_per_slice 
      end
    end
  
    slices
  end
  
  # Клієнтський код
  puts 'Введіть пиріг з родзинками (кожен рядок окремо, для завершення введення натисніть Enter двічі):'
  input_cake = []
  while (line = gets.chomp) != ''
    input_cake << line
  end
  
  puts 'Введіть кількість прямокутних шматочків (n):'
  n = gets.chomp.to_i
  
  result = slice_cake(input_cake, n)
  
  # Виводимо результат
  result.each_with_index do |slice, idx|
    puts "Шматок #{idx + 1}:"
    slice.each { |row| puts row }
    puts
  end
  