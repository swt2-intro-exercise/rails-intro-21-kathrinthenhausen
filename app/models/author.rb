class Author < ApplicationRecord
    has_and_belongs_to_many :papers
    validates :first_name, :last_name,  presence: true

    def name
        return first_name + " " + last_name
    end
end
