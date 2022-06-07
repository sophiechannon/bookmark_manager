class Bookmark
  def self.all
    connection = PG.connect( dbname: 'bookmark_manager')
    rows = connection.exec ("SELECT * FROM bookmarks")
    rows.map {| row| row['url'] }
  end  
end