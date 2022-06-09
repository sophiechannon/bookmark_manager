require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      bookmark = Bookmark.create(url: 'http://www.makersacademy.com', title: "Makers Academy")
      # persisted_data = persisted_data(id: bookmark.id)

      bookmarks = Bookmark.all

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq bookmark.id
      # expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.title).to eq'Makers Academy'
      expect(bookmark.url).to eq 'http://www.makersacademy.com'
    end

    describe '.create' do
      it 'adds a bookmark to the database' do
        bookmark = Bookmark.create(url: 'http://www.github.com', title: "Github")
        expect(bookmark.url).to eq 'http://www.github.com'
        expect(bookmark.title).to eq 'Github'
      end
    end

    describe '.delete' do
      it 'deletes a bookmark from the database' do
        bookmark = Bookmark.create(url: 'http://www.github.com', title: "Github")
        Bookmark.delete(id: bookmark.id)
        expect(Bookmark.all.length).to eq 0
      end
    end
  end
end