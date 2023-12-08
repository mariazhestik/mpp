def counting_sort(arr)
    # Створюємо масив для підрахунку кількості кожного елемента
    max_value = arr.max

    # Створюємо масив для підрахунку кількості кожного елемента
    count_array = Array.new(max_value + 1, 0)

     # Підрахунок кількості кожного елемента у вхідному масиві
    arr.each { |n| count_array[n] += 1 }

    # Ініціалізуємо порожній масив для збереження відсортованих значень
    sorted_arr = []
    
    # Заповнюємо відсортований масив значеннями згідно з їх кількістю
    count_array.each_with_index do |count, i|
      sorted_arr += [i] * count
    end
  
    sorted_arr
  end
  
  # Клієнтський код для тестування сортування
  print 'Enter numbers separated by space: '
  user_input = gets.chomp
  unsorted_array = user_input.split.map(&:to_i)
  
  if unsorted_array.empty?
    puts 'Invalid input. Please enter at least one number.'
  else
    sorted_array = counting_sort(unsorted_array)
    puts "Original array: #{unsorted_array}"
    puts "Sorted array: #{sorted_array}"
  end
  