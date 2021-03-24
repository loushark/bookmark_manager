require 'bookmarks.rb'

describe Bookmarks do
	let(:newBookmark) {Bookmarks.new('title', 'url')}

	describe '.all' do
		it 'returns all bookmarks' do
			connection = PG.connect(dbname: 'bookmark_manager_test')

			connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
    	connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
    	connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")

			bookmarks = Bookmarks.all

			expect(bookmarks).to include("http://www.makersacademy.com")
			expect(bookmarks).to include("http://www.destroyallsoftware.com")
			expect(bookmarks).to include("http://www.google.com")
		end
	end

	describe '.all' do
		it 'returns all bookmarks' do
			connect = PG.connect :dbname => 'bookmark_manager_test'
			bookmark = Bookmarks.create(url:'http://www.makersacademy.com', title: 'Makers')
			bookmarks = Bookmarks.all
			expect(bookmarks).to include('http://www.makersacademy.com')
			expect(bookmarks).to include('Makers')
		end
	end

	describe '.create' do
		it 'creates a new bookmark' do
			Bookmarks.create(url:'http://www.testbookmark.com', title: 'Test')
			expect(Bookmarks.all).to include 'http://www.testbookmark.com'
			expect(Bookmarks.all).to include 'Test'
		end
	end

	describe 'bookmark instance' do
		it 'has a title and url' do
			expect(newBookmark.title).to eq 'title'
			expect(newBookmark.url).to eq 'url'
		end
	end
end
