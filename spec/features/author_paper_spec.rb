require "rails_helper"

describe "Author Paper Relation" do
    it "should exist an empty author list for a paper" do
        @ff = Paper.new(:title => "Fuenf Freunde", :venue => "Felseninsel", :year => 1942)
        expect(@ff.authors).to eq([])
    end
end