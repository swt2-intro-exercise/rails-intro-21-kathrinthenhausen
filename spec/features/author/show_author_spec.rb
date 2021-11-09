require 'rails_helper'

describe "Author show page test" do
    it "should visit an authors details page" do
        @alan = Author.new(:first_name => "alan", :last_name => "turing", :homepage => "http://wikipedia.org/Alan_Turing")
        @alan.save
        visit author_path(@alan)
        expect(page).to have_text("alan")
        expect(page).to have_text("turing")
        expect(page).to have_text("http://wikipedia.org/Alan_Turing")
    end
end