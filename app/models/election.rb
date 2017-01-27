class Election < ActiveRecord::Base
    has_and_belongs_to_many :candidats
    belongs_to :elections_type
end
