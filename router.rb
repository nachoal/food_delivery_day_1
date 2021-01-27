class Router
  # add variable for sessions_controller and create instance var
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = true
  end

  def run
    # call the sessions controller
    while @running
      @current_user = @sessions_controller.login
      while @current_user
        if @current_user.manager?
          display_manager_actions
        else
          display_delivery_guy_actions
        end
      end
      print `clear`
      
    end
  end

  private

  def display_manager_actions
    print_manager_menu
    choice = gets.chomp.to_i
    print `clear`
    
    route_manager_action(choice)
  end

  def print_manager_menu
    puts "--------------------"
    puts "------- MENU -------"
    puts "--------------------"
    puts "1. Add new meal"
    puts "2. List all meals"
    puts "3. Add new customer"
    puts "4. List all customers"
    puts "5. Add new order"
    puts "6. List all undelivered meals"
    puts "7. logout"
    puts "8. Exit"
    print "> "
  end

  def print_delivery_guy_menu
    puts "--------------------"
    puts "------- MENU -------"
    puts "--------------------"
    puts "1. List all my undelivered orders"
    puts "2. Mark order as delivered"
    puts "3. logout"
    puts "4. Exit"
    print "> "
  end

  def route_manager_action(choice)
    case choice
    when 1 then @orders_controller.list_employee_orders
    when 2 then @orders_controller.mark_as_delivered
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    # when 5 then @orders_controller.add
    # when 6 then @orders_controller.list
    when 7 then @current_user = false
    when 8 then stop!
    else puts "Try again..."
    end
  end

  def route_delivery_guy_action(choice)
    case choice
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @current_user = false
    when 4 then stop!
  end

  def stop!
    @current_user = false
    @running      = false
  end
end
