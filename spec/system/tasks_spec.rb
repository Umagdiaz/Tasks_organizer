require 'rails_helper'

RSpec.describe "Tasks", type: :system do
let(:user) {create :user}
before(:each) { sign_in user }
  before do
    driven_by(:rack_test)
  end

  describe 'GET /tasks' do
  it 'has a correct title' do
    visit '/tasks'
      expect(page).to have_content 'Listing Tasks'
    end
  end  

  describe 'POST /tasks' do
    let!(:category) { create :category}
    let!(:participant) { create :user}
    it 'create new task', js: true do
      visit '/tasks/new'

      fill_in 'Name', with: 'Test 2'
      fill_in 'Description', with: 'Desc'
      fill_in 'Expiration Date', with: Date.today
      select category.name, from: 'Category'

      click_button 'Add'
      xpath = '//*[@id="new_task"]/div[2]'
      within(:xpath, xpath) do
        select participant.email, from: 'User'
        select 'responsible', from: 'Rol'        
      end
    
    end
  end
end
