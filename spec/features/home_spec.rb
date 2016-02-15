require 'rails_helper'

describe 'home page' do
  it 'welcomes the user when not logged in' do
    visit '/'
    content = 'To create a new Recipe, login or create a new account'
    page.should have_content(content)
  end

  it 'welcomes the user when not logged in' do
    login_as(create(:user), scope: :user)
    visit '/'
    content = 'To create a new Recipe, login or create a new account'
    page.should have_content('Logout')
    page.should have_no_content(content)
  end
end
