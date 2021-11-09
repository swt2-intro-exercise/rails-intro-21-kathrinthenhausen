require "rails_helper"

describe "Filter Papers Test" do
    it "should filter papers in URL for years" do
        @alan = Paper.new(:title => "alan", :venue => "turing", :year => "1912")
        @alan.save
        @blan = Paper.new(:title => "blan", :venue => "buring", :year => "1984")
        @blan.save
        visit ("http://localhost:3000/papers?year=1912")
        expect(page).to have_text("alan")
        expect(page).not_to have_text("blan")
    end
end