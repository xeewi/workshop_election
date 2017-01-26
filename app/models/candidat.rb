class Candidat < ActiveRecord::Base
    has_many :candidats_election
    has_many :election, :through => :candidats_election
    has_many :user
	attr_accessor :user
end
