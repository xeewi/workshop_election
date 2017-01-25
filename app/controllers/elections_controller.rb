require 'date'
class ElectionsController < ApplicationController
  def index

    @elections = Election.all

    @elections.each do |election|
      stringDate = election.begin
      parsedDate = DateTime.parse(stringDate)
      formattedDate =  l(parsedDate, format: '%B %d, in the year %Y in %H heure')
      election.begin = formattedDate

      stringDate = election.end
      parsedDate = DateTime.parse(stringDate)
      formattedDate =  l(parsedDate, format: '%B %d, in the year %Y in %H heure')
      election.end = formattedDate
      
      election.type = Election.joins("INNER JOIN elections_types ON elections_types.election_type_id = election.id")
    end

  end
end
