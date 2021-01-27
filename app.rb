require_relative "app/repositories/meal_repository"
require_relative "app/controllers/meals_controller"
require_relative "app/repositories/customer_repository"
require_relative "app/controllers/customers_controller"
# Require the employee repository
require_relative "app/repositories/employee_repository" 
# Require the sessions controller
require_relative "app/controllers/sessions_controller"
require_relative "router"


MEALS_CSV_FILE = File.join(__dir__, "./data/meals.csv")
CUSTOMERS_CSV_FILE = File.join(__dir__, "./data/customers.csv")
EMPLOYEE_CSV_FILE = File.join(__dir__, "./data/employees.csv")

meal_repository = MealRepository.new(MEALS_CSV_FILE)
meals_controller = MealsController.new(meal_repository)

customer_repository = CustomerRepository.new(CUSTOMERS_CSV_FILE)
customers_controller = CustomersController.new(customer_repository)

# AS AN EMPLOYEE I CAN LOGIN
# define an employee repository variable and initialize a new instance
employee_repository = EmployeeRepository.new(EMPLOYEE_CSV_FILE)
# define a variable sessions_controller and initialize a new instance
sessions_controller = SessionsController.new(employee_repository)

                                    # pass the sessions_controller
router = Router.new(meals_controller, customers_controller, sessions_controller)
router.run
