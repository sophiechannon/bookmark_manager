class Bookmark
  def self.all
    if ENV['ENVIRONMENT'] = 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    rows = connection.exec ("SELECT * FROM bookmarks")
    rows.map { |row| row['url'] }
  end  

  def self.create(bookmark)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
      puts "fake"
    else
      connection = PG.connect(dbname: 'bookmark_manager')
      puts "real"
    end
    connection.exec("INSERT INTO bookmarks (url) VALUES('#{bookmark}');")
  end
end