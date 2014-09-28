class InterviewsController < ApplicationController
  before_action :set_interview, only: [:show, :edit, :update, :destroy, :new_question, :delete_question]

  # GET /interviews
  # GET /interviews.json
  def index
    @interviews = Interview.all
  end

  # GET /interviews/1
  # GET /interviews/1.json
  def show
    @questions = Question.where("interview = ?", @interview.id)
  end

  # GET /interviews/new
  def new
    @interview = Interview.new
    @companies = getCompanies
  end

  # GET /interviews/1/edit
  def edit
  end

  # POST /interviews
  # POST /interviews.json
  def create
    @interview = Interview.new
    @interview.company = Company.find(params[:company]).name

    respond_to do |format|
      if @interview.save
        format.html { redirect_to @interview, notice: 'Interview was successfully created.' }
        format.json { render :show, status: :created, location: @interview }
      else
        format.html { render :new }
        format.json { render json: @interview.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interviews/1
  # PATCH/PUT /interviews/1.json
  def update
    respond_to do |format|
      if @interview.update(interview_params)
        format.html { redirect_to @interview, notice: 'Interview was successfully updated.' }
        format.json { render :show, status: :ok, location: @interview }
      else
        format.html { render :edit }
        format.json { render json: @interview.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interviews/1
  # DELETE /interviews/1.json
  def destroy
    @interview.destroy
    respond_to do |format|
      format.html { redirect_to interviews_url, notice: 'Interview was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  #Add a new question to this interview
  def new_question
    question = Question.new
    question.question = params[:question]
    question.interview = params[:id]
    question.save
    
    redirect_to @interview
  end
  
  def delete_question
    #@interview = Interview.find(params[:interview])
    Question.find(params[:question]).destroy
    
    redirect_to @interview
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interview
      @interview = Interview.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def interview_params
      params.require(:interview).permit(:company)
    end
  
  def getCompanies
    companies = Array.new
    Company.all.each do |company|
      companies.push([company.name, company.id])
    end
    return companies
  end
  
  
  
  #Scroll space!!!
  
  
  
end
