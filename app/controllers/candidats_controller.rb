class CandidatsController < ApplicationController
	def home

	@election = Election.find(params[:id])
	

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

	def profile
		@election = Election.find(params[:id])
		@candidat = Candidat.find(params[:id_candidat])
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

	def vote 
		self.user_connected();
		# verrify if user déja voté
		@candidat_election = CandidatsElection.where(["election_id = :election_id", { election_id: params["election_id"] }])
		
		# candidat_election.each do |f|
		# 	vote = Vote.where(["user_id = :user_id AND candidat_election_id = :candidat_election_id", { user_id: session[:current_user_id], candidat_election_id: f.id}])
		# 	if !vote.blank?
		# 		# je vote pas
		# 		redirect_to "/home/index?vote=deja"
		# 	end
		# end

		# # je vote 
		# vote = Vote.create(user_id:  session[:current_user_id], candidat_election_id: candidat_election.id)

		# # election candidat 
		# # vote 

	end

end
