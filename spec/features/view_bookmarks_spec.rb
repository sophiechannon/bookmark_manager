feature "bookmark page" do
  scenario "user can see bookmarks" do
    Bookmark.create(url: 'http://www.makersacademy.com', title: "Makers Academy")
    Bookmark.create(url: 'http://www.google.com', title: "Google")
    Bookmark.create(url: 'http://www.macramazing.co.uk', title: "Macramazing")

    visit '/bookmarks'

    expect(page).to have_link("Makers Academy", href: "http://www.makersacademy.com")
    expect(page).to have_link("Google", href: 'http://www.google.com')
    expect(page).to have_link("Macramazing", href: 'http://www.macramazing.co.uk')
  end
end
