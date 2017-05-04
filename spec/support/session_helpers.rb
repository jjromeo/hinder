module SessionHelpers
  def sign_up(email)
    visit new_user_registration_path
    fill_in 'Email', with: email
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
  end

  def sign_in(email)
    visit new_user_session_path
    fill_in 'Email', with: email
    fill_in 'Password', with: 'password'
    click_button 'Log in'
  end

  RSpec.configure do |config|
    config.include SessionHelpers, type: :feature
  end
end
