class Election < ActiveRecord::Base
    has_many :candidats_election
    has_many :candidat, :through => :candidats_election
    belongs_to :elections_type
end
