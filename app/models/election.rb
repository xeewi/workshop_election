class Election < ActiveRecord::Base
    has_many :candidats
    belongs_to :elections_type
end
