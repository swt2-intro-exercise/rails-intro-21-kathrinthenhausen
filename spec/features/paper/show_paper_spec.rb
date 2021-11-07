require 'rails_helper'

describe "Paoer show page test" do
    it "should visit an papers details page" do
        @alan = Paper.new(:title => "alan", :venue => "turing", :year => "1912")
        @alan.save
        visit paper_path(@alan)
        expect(page).to have_text("alan")
        expect(page).to have_text("turing")
        expect(page).to have_text("1912")
    end
end