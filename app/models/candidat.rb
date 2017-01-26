class Candidat < ActiveRecord::Base
    belongs_to :election
	attr_accessor :user
end
