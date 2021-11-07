require 'rails_helper'

describe "Paper show page test" do
    it "should visit an papers details page" do
        @alan = Paper.new(:title => "alan", :venue => "turing", :year => "1912")
        @alan.save
        visit paper_path(@alan)
        expect(page).to have_text("alan")
        expect(page).to have_text("turing")
        expect(page).to have_text("1912")
    end

    it "should show associated authors" do
        @alan = Paper.new(:title => "alanspaper", :venue => "GB", :year => "1912")
        @alan.save
        @writer = Author.new(:first_name => "alan", :last_name => "turing", :homepage => "http://wikipedia.org/Alan_Turing")
        @alan.authors << @writer
        visit paper_path(@alan)
        expect(page).to have_text("alan")
        expect(page).to have_text("turing")
    end
end