# Функція для розрізання пирогу на прямокутні шматочки з родзинками.
def slice_cake(cake, n)
    raisin_count = cake.join.count('o') # Знаходимо загальну кількість родзинок в пирозі.
    raisins_per_slice = raisin_count / n # Визначаємо, скільки родзинок має бути в кожному шматочку.
  
    slices = [] # Створюємо порожній список для зберігання шматочків.
    slice = [] # Порожній список для поточного шматочка.
    remaining_raisins = raisins_per_slice # Лічильник родзинок для поточного шматочка.
  
    # Проходимо через кожен рядок пирога.
    cake.each do |row|
      slice << row # Додаємо рядок до поточного шматочка.
      remaining_raisins -= row.count('o') # Віднімаємо кількість родзинок у рядку від лічильника.
  
      if remaining_raisins == 0
        slices << slice # Якщо лічильник дорівнює 0, додаємо поточний шматочок до списку.
        slice = [] # Очищуємо поточний шматочок для наступного.
        remaining_raisins = raisins_per_slice # Скидаємо лічильник родзинок для наступного шматочка.
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
  