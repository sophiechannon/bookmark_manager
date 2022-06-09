feature "add bookmark" do
  scenario "user adds a bookmark" do
    visit '/bookmarks/add'
    fill_in :url, with: "http://www.github.com"
    fill_in :title, with: "Github"
    click_button "Add"
    expect(page).to have_link("Github", href: "http://www.github.com")
  end
end


