require 'rails_helper'

describe "Index author page", :type => :feature do
  
    it "should display overview of authors" do
        @ff = Paper.new(:title => "Fuenf Freunde", :venue => "Felseninsel", :year => 1942)
        @ff.save
        visit papers_path
        expect(page).to have_css('table', text:@ff.title, text:@ff.year, text:@ff.venue)
        expect(page).to have_link 'Show', href: paper_path(@ff)
        expect(page).to have_link 'Edit', href: edit_paper_path(@ff)
        expect(page).to have_link 'New Paper', href: new_paper_path
    end
end