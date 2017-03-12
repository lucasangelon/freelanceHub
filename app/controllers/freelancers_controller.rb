class FreelancersController < ApplicationController

  # GET /
  #
  # Displays the list of freelancers in the database.
  def index
    @freelancers = Freelancer.all
  end

  # GET /new
  #
  # Generates a new Freelancer object for the view.
  def new
    @freelancer = Freelancer.new
    2.times { @freelancer.projects.build }
  end

  # POST /
  #
  # Accepts the parameters for a new freelancer and executes the insert.
  def create
    @freelancer = Freelancer.new(freelancer_params)

    if @freelancer.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
    def freelancer_params
      params.require(:freelancer).permit(:first_name, :last_name, :specialty,
                                         projects_attributes: [:title, :technologies, :year_of_completion])
    end
end


