# Модуль Printable містить метод для виведення інформації про будь-який об'єкт класу, що включає цей модуль.
module Printable
    def print_info
      puts "#{self.class} Information:"
      instance_variables.each { |var| puts "#{var}: #{instance_variable_get(var)}" }
    end
  end
  
  # Приклад використання модуля в класі Example.
  class Example
    include Printable
  
    # Ініціалізація об'єкта класу Example з параметрами name та value.
    def initialize(name, value)
      @name = name
      @value = value
    end
  end
  
  # Створення об'єкта класу Example та виклик методу для виведення інформації про об'єкт.
  obj = Example.new("Sample", 42)
  obj.print_info