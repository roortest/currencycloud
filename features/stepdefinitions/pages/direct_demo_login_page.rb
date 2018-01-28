class DirectDemoLoginPage < SitePrism::Page
  set_url Capybara.app_host

  element :login_id_field, '#login_id_form_username'
  element :password_field, '#login_form_password'
  element :login_button, '#go-btn'
  element :logout, 'a.txt-btn-xs'
  element :profile_link, 'a.txt-btn-xs.i-cc-underlined'
  element :generate_api_btn, '#reset-api-btn'
  element :understand_generate_key_btn, 'button.ajs-button.btn.btn-danger'


  def login_as(user1)
  login_id_field.set($users[user1]['email'])
  password_field.set($users[user1]['password'])
  login_button.click
  end

  def generate_api_key
    page.find('profile_link').click
    if (page.should have_no_css('generate_api_btn'))
      expect(find('#api-key-input').value).to eql("$users[user2]['api_key']")
    else
      expect(page).to have_css('generate_api_btn', text:'Generate Key', visible: true)
      page.find('generate_api_btn').click
      expect(page).to have_css('understand_generate_key_btn', text:'I understand, generate key', visible: true)
      page.find('understand_generate_key_btn').click
      expect(page).to have_css('#api-key-input', visible: true)
    end
  end


  def verify_generate_api_key
    page.should have_css('#api-key-input', visible: true)
    expect(find('#api-key-input').value).to eql("$users[user2]['api_key']")
  end





end