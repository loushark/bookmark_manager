require 'pg'

class Bookmarks

	def self.all

		if ENV['ENVIRONMENT'] == 'test'
			connect = PG.connect :dbname => 'bookmark_manager_test'
		else
			connect = PG.connect :dbname => 'bookmark_manager'
		end

		result = connect.exec "SELECT * FROM bookmarks"
		result.map {|bookmark| "#{bookmark['url']}"}
	end

	def self.create(url:)
		if ENV['ENVIRONMENT'] == 'test'
    	connection = PG.connect(dbname: 'bookmark_manager_test')
  	else
    	connection = PG.connect(dbname: 'bookmark_manager')
  	end
  connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
	end
end
