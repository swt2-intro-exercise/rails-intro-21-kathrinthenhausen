require 'rails_helper'

describe "New author page", type: :feature do
    it "should exist at 'new_author_path' and render withour error" do
        # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
        visit new_author_path
    end

    it "should have text inputs for an author's first name, last name, and homepage" do
        visit new_author_path
        # these are the standard names given to inputs by the Rails form builder
        expect(page).to have_field('author[first_name]')
        expect(page).to have_field('author[last_name]')
        expect(page).to have_field('author[homepage]')
    end

 end

 describe "Add new author", type: :feature do
    it "should save the filled-in data in the database" do
        visit new_author_path
        page.fill_in 'author[first_name]', with: 'Edsger'
        page.fill_in 'author[last_name]', with: 'Dijkstra'
        page.fill_in 'author[homepage]', with: 'https://dijkstra.rocks'
        find('input[type="submit"]').click
        expect(Author.exists?(first_name: 'Edsger', last_name: 'Dijkstra', homepage: 'https://dijkstra.rocks')).to be true
    end
end

describe "Validations", type: :feature do
    it "should validate authors data on completeness" do
        visit new_author_path
        page.fill_in 'author[first_name]', with: 'Ed'
        page.fill_in 'author[homepage]', with: 'https://dijkstra.rocks'
        find('input[type="submit"]').click
        expect(Author.where(first_name: 'Ed')).not_to be_present
    end

    it "should direct to error page if validation fails" do
        visit new_author_path
        page.fill_in 'author[first_name]', with: 'Ed'
        page.fill_in 'author[homepage]', with: 'https://dijkstra.rocks'
        find('input[type="submit"]').click
        expect(page).to have_text("prohibited this author from being saved:")
    end

 end
