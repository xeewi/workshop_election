class CandidatsController < ApplicationController
  def index
  end

  def home

    @election = Election.find(params[:id])
    @election.candidats = Candidat.where(["election_id = :election_id", { election_id: params[:id]}])

    stringDate = @election.begin
    parsedDate = DateTime.parse(stringDate)
    formattedDate =  l(parsedDate, format: '%B %d, in the year %Y in %H heure')
    @election.begin = formattedDate

    stringDate = @election.end
    parsedDate = DateTime.parse(stringDate)
    formattedDate =  l(parsedDate, format: '%B %d, in the year %Y in %H heure')
    @election.end = formattedDate


  end
end
