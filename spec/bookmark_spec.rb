require 'bookmark'

describe Bookmark do
  describe '.all' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    it 'returns all bookmarks' do
      connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.google.com');")
      connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.macramazing.co.uk');")

      bookmarks = Bookmark.all

      expect(bookmarks).to include('http://www.makersacademy.com')
      expect(bookmarks).to include('http://www.google.com')
      expect(bookmarks).to include('http://www.macramazing.co.uk')

    end

    it 'adds a bookmark to the database' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      Bookmark.create('http://www.hello.com')
      expect(Bookmark.all).to include('http://www.hello.com')
    end
  end
end