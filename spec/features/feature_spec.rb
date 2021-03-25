require './app.rb'
require 'spec_helper'

feature 'index page' do
  scenario 'index page exists' do
    visit '/'
    expect(page).to have_content("hello world!")
  end
end

feature 'bookmarks page' do
  scenario 'exists' do
    visit '/bookmarks'
    expect(page).to have_content("Bookmarks:")
  end

  scenario 'shows bookmarks' do
    clear_and_pop_db
    expect(page).to have_content("Makers")
    expect(page).to have_content("Destroy all software")
    expect(page).to have_content("Google")
  end

  feature 'adding bookmark' do
    scenario 'checks add bookmark page exists' do
      visit 'bookmarks/addbookmark'
      expect(page).to have_content("Add bookmark")
    end

    scenario 'A user can add a bookmark to Bookmark Manager' do
        visit('/bookmarks/addbookmark')
        fill_in('url', with: 'http://testbookmark.com')
        fill_in('title', with: 'Test')
        click_button('add')

        expect(page).to have_link(href: 'http://testbookmark.com')
      end
  end
end
