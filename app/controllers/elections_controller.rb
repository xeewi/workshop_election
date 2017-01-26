require 'date'
include ActionView::Helpers::NumberHelper

class ElectionsController < ApplicationController
  def home

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
    end

  end

  # Admin

  def index
    self.admin_connected()
    @elections = Election.order('id DESC').paginate(:page => params[:page])
    @types = ElectionsType.all
  end

  def show
    self.admin_connected()
    @election = Election.find(params['id'])
    @types = ElectionsType.all

    @candidatsElection = CandidatsElection.where(election_id: params['id']).all
    
    @candidats = []

    @candidatsElection.each do |candidatElection|
      candidat = Candidat.find(candidatElection['candidat_id'])
      user = User.find(candidat['user_id'])
      @candidats << [candidat, user, candidatElection]
    end

    split = @election['end'].split('-')
    if Date.today > Date.new(split[0].to_i, split[1].to_i, split[2].to_i)
      @votes = []
      @allvotes = 0;

      allvotes = []
      
      @candidatsElection.each do |candidatElection|
        votes = Vote.where(candidat_election_id: candidatElection['id'])
        allvotes = allvotes + votes
      end
      
      @allvotes = allvotes.count

      @candidatsElection.each do |candidatElection|
        candidat = Candidat.find_by id: candidatElection['candidat_id']
        user = User.find_by id: candidat['user_id']
        votes = Vote.where(candidat_election_id: candidatElection['id'])
        votes_count = votes.count / (@allvotes/100.0)
        votes_count = number_with_precision(votes_count, precision: 2)
        @votes << [candidatElection,user,votes_count]
      end
    end

  end

  def add
    self.admin_connected()
    @types = ElectionsType.all
  end

  def create
    self.admin_connected()
    Election.create(name: params['name'], begin: params['begin'], end: params['end'], category: params['category'])    

    redirect_to '/admin/elections' + '?result=create'
  end

  def edit
    self.admin_connected()
    Election.find(params['id']).update name: params['name'], begin: params['begin'], end: params['end'], category: params['category']
    
    redirect_to '/admin/elections/' + params['id'].to_s + '?result=ok'
  end

  def delete
    self.admin_connected()
    Election.find(params['id']).delete

    redirect_to '/admin/elections/' + '?result=delete'
  end

  # Admin types
  def types_add
    self.admin_connected()
  end

  def types_show
    self.admin_connected()
    @type = ElectionsType.find(params['id']);
  end

  def types_create
    self.admin_connected()
    ElectionsType.create(name: params['name'])    

    redirect_to '/admin/elections' + '?result=create'
  end

  def types_edit
      self.admin_connected()
      ElectionsType.find(params['id']).update name: params['name']
      
      redirect_to '/admin/elections/types/' + params['id'].to_s + '?result=ok'
  end

  def types_delete
    self.admin_connected()
    ElectionsType.find(params['id']).delete

    redirect_to '/admin/elections' + '?result=delete'
  end

  # Admin candidate
  def candidats_add
  end

  def candidats_show
    @candidatElection = CandidatsElection.find_by id: params['candidat_id']
    @candidat = Candidat.find_by id: @candidatElection['candidat_id']
    @user = User.find_by id: @candidat['user_id']
    @election = Election.find_by id: params['id']
  end

  def candidats_create
    user = User.find_by email: params['email']
    if user.blank?
      redirect_to '/admin/elections/' + params['id'] + '/candidats/add?result=user'
      return 
    end
    
    candidat = Candidat.find_by user_id: user['id']
    if candidat.blank?
      redirect_to '/admin/elections/' + params['id'] + '/candidats/add?result=candidat'
      return       
    end

    CandidatsElection.create election_id: params['id'], candidat_id: candidat['id']
    redirect_to '/admin/elections/' + params['id'] + '?result=ok'
  end

  def candidats_delete
    CandidatsElection.delete(params['candidat_id'])
    redirect_to '/admin/elections/' + params['id'] + '?result=ok'
  end

end
