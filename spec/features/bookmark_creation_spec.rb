# in spec/features/bookmarks_creation_spec.rb

feature 'Creating bookmarks' do
  scenario 'A user can create new bookmarks' do
    visit('/bookmarks/new')
    fill_in('url', with: 'https://www.apple.com/uk/')
    fill_in('title', with: 'The Apple(UK) website')
    click_button "Add Bookmark"
    expect(page).to have_link('The Apple(UK) website', href: 'https://www.apple.com/uk/')
  end
end

feature "bookmark validation" do
  scenario "user enters an invalid URL" do
    visit '/bookmarks/new'
    fill_in :title, with: "Google"
    fill_in :url, with: "ww.goggle.com"
    click_button "Add Bookmark"
    expect(page).not_to have_content "ww.google.com"
    expect(page).to have_content "You must submit a valid URL"
  end
end