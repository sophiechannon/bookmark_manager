feature "delete bookmark" do
  scenario "deleted a bookmark" do
    Bookmark.create(url: 'http://github.com', title: 'Github')
    visit "/bookmarks"
    expect(page).to have_link('Github', href: 'http://github.com')
    first('.bookmark').click_button 'Delete'
    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Github', href: 'http://github.com')
  end
end