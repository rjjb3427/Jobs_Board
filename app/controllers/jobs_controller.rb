class JobsController < ApplicationController
	
	before_action :find_job, only: [:show, :edit, :update, :destroy] #this action will run our find_jobs private method on the controllers show, edit, update, and destroy method 
		
	def index
		@jobs = Job.all.order("created_at DESC")#code here// this code displays the jobs in desending order
	end
	
	def show
		#code here
	end
	
	def new
		@job = Job.new#code here
	end
	
	def create
		@job = Job.new(jobs_params)#code here
		
		if @job.save
			redirect_to @job 
		else
			render "New"
		end
	end
	
	def edit
		#code here
	end
	
	def update
		if @job.update(jobs_params)#code here
			redirect_to @job
		else
			render "Edit"
		end 
	end
	
	def destroy
		#code here
	end
	
	private # My private methods go down down below ho ho!
	
	def jobs_params
		params.require(:job).permit(:title, :description, :company, :url)#code here
	end
	
	def find_job
		@job = Job.find(params[:id])#code here// This is here because we're going to reuse this in the show, edit, update, and destroy methods. 
	end
	
end
