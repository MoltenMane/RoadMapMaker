class Projects::ProblemsController < ApplicationController
  before_action :get_project
  before_action :set_problem, except: [:index, :new, :create] #only: [:show, :edit, :update, :destroy]

  # GET /problems
  # GET /problems.json
  def index
    @problems = @project.problems
  end

  # GET /problems/1
  # GET /problems/1.json
  def show
  end



  # GET /problems/new
  def new
    @problem = @project.problems.build
  end

  # GET /problems/1/edit
  def edit
  end



  

  # POST /problems
  # POST /problems.json
  def create
    @problem =  @project.problems.build(problem_params)
    if @problem.save
      redirect_to Project.find(params[:project_id])
    else
      render :new 
    end
  end

  # PATCH/PUT /problems/1
  # PATCH/PUT /problems/1.json
  def update
    respond_to do |format|
      if @problem.update(problem_params)
        format.html { redirect_to @project, notice: 'Problem was successfully updated.' }
        format.json { render :show, status: :ok, location: @problem }
      else
        format.html { render :edit }
        format.json { render json: @problem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /problems/1
  # DELETE /problems/1.json
  def destroy
    @problem.destroy
    respond_to do |format|
      format.html { redirect_to @project, notice: 'Problem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  
    def get_project
      @project = Project.find(params[:project_id])
    end


    
    # Use callbacks to share common setup or constraints between actions.
    def set_problem
      @problem = @project.problems.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def problem_params
      params.require(:problem).permit(:name, :description, :project_id)
    end
end
