feature "bookmark page" do
  scenario "user can see bookmarks" do
    Bookmark.create('http://www.makersacademy.com')
    Bookmark.create('http://www.google.com')
    Bookmark.create('http://www.macramazing.co.uk')

    visit "/bookmarks"

    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.google.com"
    expect(page).to have_content "http://www.macramazing.co.uk"
  end
end
