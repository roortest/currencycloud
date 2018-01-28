class DirectDemoLoginPage < SitePrism::Page
  set_url Capybara.app_host

  element :login_id_field, '#login_id_form_username'
  element :password_field, '#login_form_password'
  element :login_button, '#go-btn'
  element :logout, 'a.txt-btn-xs'



  def login_as(user1)
  login_id_field.set($users[user1]['email'])
  password_field.set($users[user1]['password'])
  login_button.click
  end





end