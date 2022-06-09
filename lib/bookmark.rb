class Bookmark
  attr_reader :id, :title, :url
  @@connection = nil

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    test_or_dev
    rows = @@connection.exec ("SELECT * FROM bookmarks")
    rows.map do |bookmark|
      Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url']) 
    end
  end  

  def self.create(url:, title:)
    test_or_dev
    result = @@connection.exec_params(
      "INSERT INTO bookmarks (url, title) VALUES($1, $2) RETURNING id, title, url;", [url, title])
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  private

  def self.test_or_dev
    if ENV['ENVIRONMENT'] == 'test'
      @@connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      @@connection = PG.connect(dbname: 'bookmark_manager')
    end
  end
end