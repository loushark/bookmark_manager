def clear_and_pop_db
  connection = PG.connect(dbname: 'bookmark_manager_test')

 connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com', 'Makers');")
 connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.destroyallsoftware.com', 'Destroy all software');")
 connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.google.com', 'Google');")

 visit '/bookmarks'

end
