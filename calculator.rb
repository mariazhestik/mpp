#Функція для перетворення в RPN
def expression_to_rpn(expression)
    # Оператори, які ми підтримуємо
    operators = "+-*/"
    # Стек для виводу виразу в RPN.
    output = []
    # Стек для операцій та дужок.
    stack = []
  
    priority = {
      "+" => 1,
      "-" => 1,
      "*" => 2,
      "/" => 2
    }
  
    expression.split.each do |token|
      if token =~ /\d+/
        # Якщо токен - це число, додаємо його до виводу.
        output << token
      elsif operators.include?(token)
        while !stack.empty? && priority[token] <= priority[stack.last]
          # Доки стек не пустий і пріоритет поточного оператора не менший, виводимо оператори зі стеку.
          output << stack.pop
        end
        # Додаємо поточний оператор до стеку.
        stack << token
      elsif token == "("
        # Якщо токен - відкриваюча дужка, додаємо її до стеку.
        stack << token  
      elsif token == ")"
        while stack.last != "("
          # Доки не зустрінемо відповідну закриваючу дужку, виводимо оператори зі стеку.
          output << stack.pop
        end
        # Видаляємо відкриваючу дужку зі стеку.
        stack.pop
      end
    end
  
    while !stack.empty?
      # Виводимо залишившийся в стеці оператори.
      output << stack.pop
    end
    # Повертаємо результат обчислення у вигляді рядка RPN.
    output.join(" ")
  end
  
  if ARGV.empty?
    puts "Input your expression: "
    # Зчитуємо вираз з консолі.
    input = gets.chomp
    # Виводимо результат в RPN використовуючи функцію.
    puts expression_to_rpn(input)
  else
    # Отримуємо вираз з командного рядка.
    input = ARGV[0]
    # Виводимо результат в RPN використовуючи функцію.
    puts expression_to_rpn(input)
  end