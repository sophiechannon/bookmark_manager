require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      Bookmark.create('http://www.makersacademy.com')
      Bookmark.create('http://www.google.com')
      Bookmark.create('http://www.macramazing.co.uk')

      bookmarks = Bookmark.all

      expect(bookmarks).to include('http://www.makersacademy.com')
      expect(bookmarks).to include('http://www.google.com')
      expect(bookmarks).to include('http://www.macramazing.co.uk')
    end

    it 'adds a bookmark to the database' do
      Bookmark.create('http://www.hello.com')
      expect(Bookmark.all).to include('http://www.hello.com')
    end
  end
end