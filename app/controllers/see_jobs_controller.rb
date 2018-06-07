class SeeJobsController < ApplicationController
	def index
		@jobs = Job.all
		@htmlClass = "myTr"
	end
end
