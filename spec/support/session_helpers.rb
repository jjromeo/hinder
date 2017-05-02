module SessionHelpers
  def sign_up(email)
    visit new_user_registration_path
    fill_in 'Email', with: email
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
  end
end
