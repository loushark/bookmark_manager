require 'bookmark.rb'

describe Bookmark do
	let(:newBookmark) {Bookmark.new('title', 'url')}

	describe '.all' do
		it 'returns all bookmarks' do
			connection = PG.connect(dbname: 'bookmark_manager_test')

			connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
    	connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
    	connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")

			bookmark = Bookmark.all

			expect(bookmark[0]).to include({:title=>"", :url=>"http://www.makersacademy.com"})
		end
	end

	describe '.all' do
		it 'returns all bookmarks' do
			connect = PG.connect :dbname => 'bookmark_manager_test'
			bookmark = Bookmark.create(url:'http://www.makersacademy.com', title: 'Makers')
			bookmark = Bookmark.all
			expect(bookmark).to include({:title=>"Makers", :url=>"http://www.makersacademy.com"})
		end
	end

	describe '.create' do
		it 'creates a new bookmark' do
			Bookmark.create(url:'http://www.testbookmark.com', title: 'Test')
			expect(Bookmark.all).to include({:title=>"Test", :url=>"http://www.testbookmark.com"})
		end
	end

	describe 'bookmark instance' do
		it 'has a title and url' do
			expect(newBookmark.title).to eq 'title'
			expect(newBookmark.url).to eq 'url'
		end
	end
end
