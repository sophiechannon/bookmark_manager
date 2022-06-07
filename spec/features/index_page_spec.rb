feature "testing homepage" do
  scenario "Homepage contains text" do
    visit "/"
    expect(page).to have_text("Bookmark Manager")
  end
end