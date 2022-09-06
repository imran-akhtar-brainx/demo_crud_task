class CandidatesController < ApplicationController
  def index
    @hiring_position = HiringPosition.find(params[:hiring_position_id])
    @candidates = Candidate.where(hiring_position_id: params[:hiring_position_id])
  end
  
  def new
    @hiring_position = HiringPosition.find(params[:hiring_position_id])
    @candidate = Candidate.new
  end

  def create
      @hiring_position = HiringPosition.find(params[:hiring_position_id])
      @candidate = @hiring_position.candidates.create(candidate_params)
      redirect_to hiring_position_path(@hiring_position)
  end
  
  def edit
    @hiring_position = HiringPosition.find(params[:hiring_position_id])
    @candidate = @hiring_position.candidates.find(params[:id])
  end

def update
  # debugger
  @hiring_position = HiringPosition.find(params[:hiring_position_id])
  @candidate = @hiring_position.candidates.find(params[:id])
  
  if @candidate.update(candidate_params)
    redirect_to hiring_position_candidates_path
  else
   render :edit, status: :unprocessable_entity
  end
end  

def destroy  
  debugger
  @hiring_position = HiringPosition.find(params[:hiring_position_id])
  @candidate = @hiring_position.candidates.find(params[:id])
  @candidate.destroy
  redirect_to hiring_position_candidates_path, status: :see_other 
end

  private
    def candidate_params
      params.require(:candidate).permit(:name, :address, :age , :cgpa, :image)
    end
end
