class CandidatsController < ApplicationController
	def home

	@election = Election.find(params[:id])
	@election.candidats = Candidat.where(["election_id = :election_id or test = :test", { election_id: params[:id]}])

	stringDate = @election.begin
	parsedDate = DateTime.parse(stringDate)
	formattedDate =  l(parsedDate, format: '%B %d, in the year %Y in %H heure')
	@election.begin = formattedDate

	stringDate = @election.end
	parsedDate = DateTime.parse(stringDate)
	formattedDate =  l(parsedDate, format: '%B %d, in the year %Y in %H heure')
	@election.end = formattedDate


	end
	
	def index
		self.admin_connected();
		@tmps = Candidat.order('id DESC').paginate(:page => params[:page])
		@candidats = []

		@tmps.each do |tmp|
			user = User.find(tmp['user_id'])
			@candidats << [tmp, user]
		end
	end

	def show
		self.admin_connected();
		@candidat = Candidat.find(params['id'])
		@user = User.find_by id: @candidat['user_id']
		@elections = []
		candidatsElection = CandidatsElection.where candidat_id: @candidat['id']
		candidatsElection.each do |candidatElection|
			election = Election.find_by id: candidatElection['election_id']
			@elections << election
		end
	end

	def add
		self.admin_connected();
	end

	def create
		self.admin_connected();
		user = User.find_by email: params['email']
		if user.blank?
			redirect_to '/admin/candidats/add?result=user'
			return
		end
		Candidat.create(user_id: user['id'], partie: params['partie'], description: params['description'], liste: params['liste'], programme: params['programme'])
		redirect_to '/admin/candidats?result=create'
	end

	def edit
		self.admin_connected();
		Candidat.find(params['id']).update partie: params['partie'], description: params['description'], liste: params['liste'], programme: params['programme']

		redirect_to '/admin/candidats/' + params['id'].to_s + '?result=ok'
	end

	def delete
		self.admin_connected();
		Candidat.delete(params['id'])
		redirect_to '/admin/candidats/?result=delete'
	end

end
