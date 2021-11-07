require 'rails_helper'

describe "Edit page", type: :feature do
    it "should update an authors data" do
        @alan = Author.new(:first_name => "alan", :last_name => "turing", :homepage => "http://wikipedia.org/Alan_Turing")
        @alan.save
        @alan.update(:first_name => "clan")
        @alan.reload
        expect(Author.exists?(first_name: "clan", last_name: "turing", homepage: "http://wikipedia.org/Alan_Turing")).to be true
    end

    it "should edit an authors data" do
        @alan = Author.new(:first_name => "alan", :last_name => "turing", :homepage => "http://wikipedia.org/Alan_Turing")
        @alan.save
        visit edit_author_path(@alan)
        page.fill_in 'author[first_name]', with: "blan"
        find('input[type="submit"]').click
        @alan.reload
        expect(@alan.first_name).to eq("blan")
    end
end