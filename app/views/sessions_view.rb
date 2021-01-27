class SessionsView

  def ask_username
    puts 'Enter your username:'
    print '> '
    gets.chomp
  end

  def ask_password
    puts 'Enter your password:'
    print '> '
    gets.chomp
  end

  def wrong_credentials
    puts 'Wrong username or password please try again!'
  end
end