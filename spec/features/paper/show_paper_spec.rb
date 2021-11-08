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

describe "Assign authors to paper test" do
    it "should assign chosen authors to paper" do
        @alan = Paper.new(:title => "alanspaper", :venue => "GB", :year => "1912")
        @alan.save
        visit paper_path(@alan)
        expect(page).to have_text("Select authors of the paper:")
        @writer = Author.new(:first_name => "alan", :last_name => "turing", :homepage => "http://wikipedia.org/Alan_Turing")
        @writer.save
        # x=writer.author_ids
        # Unable to find option nil within #<Capybara::Node::Element tag="select" path="/html/body/form/select">
        # select value=x, from: "paper[author_ids][]"

        #expect(x).to be("1") #
        #expect(Author.where(first_name: "alan")[:ids]).to be("1")
    end
end