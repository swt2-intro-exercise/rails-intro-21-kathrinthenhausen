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
        find('input[type="submit"]').click
        @ff.reload
        expect(@ff.title).to eq("derHund")
    end
end