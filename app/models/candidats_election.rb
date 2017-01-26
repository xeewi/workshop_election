class CandidatsElection < ActiveRecord::Base
     belongs_to :election
     belongs_to :candidat
end
