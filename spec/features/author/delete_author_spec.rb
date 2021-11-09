require 'rails_helper'

describe "Delete author" do
    it "should delete an author" do
        @alan = Author.new(:first_name => "alan", :last_name => "turing", :homepage => "http://wikipedia.org/Alan_Turing")
        @alan.save
        @alan.destroy
        expect(Author.exists?(first_name: "alan", last_name: "turing", homepage: "http://wikipedia.org/Alan_Turing")).to be false
    end
end
