class Candidat < ActiveRecord::Base
    has_and_belongs_to_many :elections
    belongs_to :user
	# attr_accessor :user
end
