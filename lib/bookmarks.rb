require 'pg'

class Bookmarks
	attr_reader :title, :url

	def initialize(title, url)
		@title = title
		@url = url
	end

	def self.all
		bookmarks_arr = []
		if ENV['ENVIRONMENT'] == 'test'
			connect = PG.connect :dbname => 'bookmark_manager_test'
		else
			connect = PG.connect :dbname => 'bookmark_manager'
		end

		result = connect.exec "SELECT * FROM bookmarks"
		result.map do |bookmark|
			bookmarks_arr << {:title => "#{bookmark['title']}", :url => "#{bookmark['url']}"}
		end
		bookmarks_arr
	end

	def self.create(url:, title:)
		if ENV['ENVIRONMENT'] == 'test'
    	connection = PG.connect(dbname: 'bookmark_manager_test')
  	else
    	connection = PG.connect(dbname: 'bookmark_manager')
  	end
  connection.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}')")
	end
end
