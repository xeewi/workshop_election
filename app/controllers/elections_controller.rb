require 'date'
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
end
