require 'rails_helper'

describe "Edit page", type: :feature do
    it "should update a papers data" do
        @ff = Paper.new(:title => "Fuenf Freunde", :venue => "Felseninsel", :year => 1942)
        @ff.save
        @ff.update(:title => "und Timmi")
        @ff.reload
        expect(Paper.exists?(:title => "und Timmi", :venue => "Felseninsel", :year => 1942)).to be true
    end

    it "should edit an authors data" do
        @ff = Paper.new(:title => "Fuenf Freunde", :venue => "Felseninsel", :year => 1942)
        @ff.save
        visit edit_paper_path(@ff)
        page.fill_in 'paper[title]', with: "derHund"
        find('input[id="submit-edit"]').click
        @ff.reload
        expect(@ff.title).to eq("derHund")
    end
end

describe "Assign authors to paper test" do
    it "should assign chosen authors to paper" do
        @writer = Author.new(:first_name => "alan", :last_name => "turing", :homepage => "http://wikipedia.org/Alan_Turing")
        @writer.save
        x=@writer[:ids]
        @alan = Paper.new(:title => "alanspaper", :venue => "GB", :year => "1912")
        @alan.save
        visit edit_paper_path(@alan)
        expect(page).to have_text("Select authors of the paper:")

        # Unable to find option nil within #<Capybara::Node::Element tag="select" path="/html/body/form/select">
        select value=x, from: "paper[author_ids][]"
        find('input[id="submit-authors"]').click
        expect(@alan.authors).to eq([@writer])
        #expect(x).to be("1") #
        #expect(Author.where(first_name: "alan")[:ids]).to be("1")
    end
end