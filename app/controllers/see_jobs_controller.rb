class SeeJobsController < ApplicationController
	def index
		@jobs = Job.all
		@htmlClass = "myTr"
		@area = ""
	end
end
