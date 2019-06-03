feature "User Registration" do
    scenario "Index page shows hello" do
        visit('/')
        expect(page).to have_content('hello')
    end 
end 