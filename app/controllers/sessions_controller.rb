require_relative '../views/sessions_view'

class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @sessions_view       = SessionsView.new
  end

  # login
  def login
    # 1. Ask for username (view)
    username = @sessions_view.ask_username
    # 2. Ask for password (view)
    password = @sessions_view.ask_password
    # 3. Call repo and search for employee by username (#find_by_username)
    employee = @employee_repository.find_by_username(username)
    # 4. If theres a user and the password is right accept 
    return employee if employee && employee.password == password

    # if the password or user are wrong try again
    @sessions_view.wrong_credentials
    # use recurssion to call login again
    login
  end

end