require 'rails_helper'

describe "Delete author" do
    it "should delete an author" do
        @ff = Paper.new(:title => "Fuenf Freunde", :venue => "Felseninsel", :year => 1942)
        @ff.save
        @ff.destroy
        expect(Paper.exists?(:title => "Fuenf Freunde", :venue => "Felseninsel", :year => 1942)).to be false
    end
end
