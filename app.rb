require 'sinatra/base'
require './lib/bookmarks'

class BookmarksManager < Sinatra::Base

  get '/' do
    erb(:index)
  end

  get '/bookmarks' do
  	@bookmarks = Bookmarks.all
    erb(:bookmarks)
  end

  get '/bookmarks/addbookmark' do
    erb :"bookmarks/addbookmark"
  end

  post '/bookmarks' do
    Bookmarks.create(url: params[:url])
  #   url = params['url']
  #   if ENV['ENVIRONMENT'] == 'test'
	# 		connect = PG.connect :dbname => 'bookmark_manager_test'
	# 	else
	# 		connect = PG.connect :dbname => 'bookmark_manager'
	# 	end
  #
  # connect.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
  redirect '/bookmarks'
  end

  run! if app_file == $0
end
