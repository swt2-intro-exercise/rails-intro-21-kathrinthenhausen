require 'rails_helper'

describe "Index author page", :type => :feature do
  
    it "should display overview of authors" do
        @alan = Author.new(:first_name => "alan", :last_name => "turing", :homepage => "http://wikipedia.org/Alan_Turing")
        @alan.save
        visit authors_path
        expect(page).to have_css('table', text:@alan.first_name, text:@alan.last_name, text:@alan.homepage)
        expect(page).to have_link 'Show', href: author_path(@alan)

    end
end