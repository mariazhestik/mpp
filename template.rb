# Базовий клас для обробки замовлень
class OrderProcessor
  def process_order
    select_delivery_method
    prepare_order
    ship_order
    send_invoice
  end

  def select_delivery_method
    puts 'Please select a delivery method:'
    puts '1. Courier Delivery'
    puts '2. Self Pickup'
    print 'Enter your choice: '
    choice = gets.chomp.to_i

    case choice
    when 1
      @delivery = CourierDelivery.new
    when 2
      @delivery = SelfPickup.new
    else
      raise 'Invalid choice'
    end
  end

  def prepare_order
    puts 'Preparing the order...'
  end

  def ship_order
    @delivery.ship
  end

  def send_invoice
    puts 'Sending invoice to the customer...'
  end
end

# Підклас для кур'єрської доставки
class CourierDelivery
  def ship
    puts 'Delivering the order by courier...'
  end
end

# Підклас для самовивозу
class SelfPickup
  def ship
    puts 'Order is ready for pickup...'
  end
end

# Клієнтський код
def main
  puts 'Welcome to the Online Store!'
  order_processor = OrderProcessor.new
  order_processor.process_order
end

main
