require 'rails_helper'

describe "New author page", type: :feature do
    it "should exist at 'new_author_path' and render withour error" do
        # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
        visit new_paper_path
    end

    it "should have text inputs for an author's first name, last name, and homepage" do
        visit new_paper_path
        # these are the standard names given to inputs by the Rails form builder
        expect(page).to have_field('paper[title]')
        expect(page).to have_field('paper[venue]')
        expect(page).to have_field('paper[year]')
    end

 end

 describe "Add new paper", type: :feature do
    it "should save the filled-in data in the database" do
        visit new_paper_path
        page.fill_in 'paper[title]', with: 'Edsger'
        page.fill_in 'paper[venue]', with: 'Dijkstra'
        page.fill_in 'paper[year]', with: '1234'
        find('input[type="submit"]').click
        expect(Paper.exists?(title: 'Edsger', venue: 'Dijkstra', year: '1234')).to be true
    end
end

describe "Validations", type: :feature do
    it "should validate papers data on completeness - title" do
        visit new_paper_path
        page.fill_in 'paper[venue]', with: 'Ed'
        page.fill_in 'paper[title]', with: 'Bd'
        find('input[type="submit"]').click
        expect(Paper.where(venue: 'Ed', title: 'Bd')).not_to be_present
    end

    it "should validate papers data on completeness - venue" do
        visit new_paper_path
        page.fill_in 'paper[venue]', with: 'Ed'
        page.fill_in 'paper[year]', with: '1234'
        find('input[type="submit"]').click
        expect(Paper.where(venue: 'Ed', year: '1234')).not_to be_present
    end

    it "should validate papers data on completeness - year" do
        visit new_paper_path
        page.fill_in 'paper[venue]', with: 'Ed'
        page.fill_in 'paper[title]', with: 'Bd'
        find('input[type="submit"]').click
        expect(Paper.where(venue: 'Ed', title: 'Bd')).not_to be_present
    end

    it "should validate papers year on right format" do
        visit new_paper_path
        page.fill_in 'paper[venue]', with: 'Ed'
        page.fill_in 'paper[title]', with: 'Bd'
        page.fill_in 'paper[year]', with: '12sa'
        find('input[type="submit"]').click
        expect(Paper.where(venue: 'Ed', title: 'Bd', year: '12sa')).not_to be_present
    end

    it "should direct to error page if validation fails" do
        visit new_paper_path
        page.fill_in 'paper[venue]', with: 'Ed'
        find('input[type="submit"]').click
        expect(page).to have_text("prohibited this paper from being saved:")
    end

 end
