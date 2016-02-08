require 'rails_helper'
require 'spec_helper'

RSpec.describe RecipeController, type: :request do
  context 'GET#index' do
    it 'should redirect to login page if not logged in' do

      @user = FactoryGirl.create(:user)
      controller.stub!(:current_user).and_return(@user)

      get recipe_index_path
      expect(response.status).to eq(302)
    end
  end
end

=begin

before :each do
    @user = Factory(:user)
    @merchant = Factory(:merchant, :user_id => @user.id,:is_approved => false, :is_blacklisted => false)
    controller.stub!(:current_user).and_return(@user)
  end

#https://github.com/kucaahbe/rspec-html-matchers
expect(rendered).to have_tag('div')
expect(rendered).to have_tag('h1.header')
expect(rendered).to have_tag('div#footer')
expect(rendered).to have_tag('input#email', :with => { :name => 'user[email]', :type => 'email' } )
expect(rendered).to have_tag('div', :count => 3)            # matches exactly 3 'div' tags
expect(rendered).to have_tag('div', :count => 3..7)         # shortcut for have_tag('div', :minimum => 3, :maximum => 7)
expect(rendered).to have_tag('div', :minimum => 3)          # matches more(or equal) than 3 'div' tags
expect(rendered).to have_tag('div', :maximum => 3)          # matches less(or equal) than 3 'div' tags
expect(rendered).to have_tag('p', :text => 'some content')  # will match "<p>some content</p>"
expect(rendered).to have_tag('p', :text => /some content/i) # will match "<p>sOme cOntEnt</p>"
expect(rendered).to have_tag('textarea', :with => {:name => 'user[description]'}, :text => "I like pie")
expect("<html>
  <body>
    <h1>some html document</h1>
  </body>
 </html>").to have_tag('body') { with_tag('h1', :text => 'some html document') }
expect('<div class="one two">').to have_tag('div', :with => { :class => ['two', 'one'] })
expect('<div class="one two">').to have_tag('div', :with => { :class => 'two one' })

#response.should redirect_to root_url
=end
