class JobsController < ApplicationController
	
	before_action :find_job, only: [:show, :edit, :update, :destroy] #this action will run our find_jobs private method on the controllers show, edit, update, and destroy method 
		
	def index
		if params[:category].blank?
			@jobs = Job.all.order("created_at DESC")#code here// this code displays the jobs in desending order
		else
			@category_id = Category.find_by(name: params[:category]).id
			@jobs = Job.where(category_id: @category_id).order("created_at DESC")
		end
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
		@job.destroy#code here
		redirect_to root_path
	end
	
	private # My private methods go down down below ho ho!
	
	def jobs_params
		params.require(:job).permit(:title, :description, :company, :url, :category_id)#code here //These inputs get saved to the database
	end
	
	def find_job
		@job = Job.find(params[:id])#code here// This is here because we're going to reuse this in the show, edit, update, and destroy methods. 
	end
	
end
