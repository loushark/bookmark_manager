require 'bookmarks.rb'

describe Bookmarks do

	describe '.all' do
		it 'returns all bookmarks' do
			connect = PG.connect :dbname => 'bookmark_manager_test'
			bookmark = Bookmarks.create(url:'http://www.makersacademy.com')
			bookmarks = Bookmarks.all
			expect(bookmarks).to include('http://www.makersacademy.com')
		end
	end

	describe '.create' do
		it 'creates a new bookmark' do
			Bookmarks.create(url:'http://www.testbookmark.com')
			expect(Bookmarks.all).to include 'http://www.testbookmark.com'
		end
	end
end
