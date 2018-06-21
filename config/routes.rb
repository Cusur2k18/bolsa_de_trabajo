Rails.application.routes.draw do
	# devise route
	devise_for :users

	devise_scope :user do
		get 'students/sign_up' => 'student_registrations#new'
		post 'students/sign_up' => 'student_registrations#create'

		get 'companies/sign_up' => 'company_registrations#new'
		post 'companies/sign_up' => 'company_registrations#create'

		get 'admins/sign_up' => 'admin_registrations#new'
		post 'admins/sign_up' => 'admin_registrations#create'

		get 'login', to: 'devise/sessions#new'
		delete 'logout', to: 'devise/sessions#destroy'

	end

	# all other routes
	root "home#index"
	get 'student_dashboard', to: 'students_dashboard#index'
	get 'companies_dashboard', to: 'companies_dashboard#index'
	get 'admin_dashboard', to: 'admins_dashboard#index'
	get 'see_jobs', to: 'see_jobs#index'

	# users routes
	resources :students
	# routes for companies, companies have custom routes for the admin to validate or invalidate a company
	resources :companies do
		member do
			post :validate
			post :unvalidate
		end
	end

	resources :admins, only: [ :index, :edit, :update, :delete ]

	# Users can add all the data or skip when they register.

	resources :job_types

	get 'educations/first_time_setup' => 'educations#get_first_time_setup'
	post 'educations/first_time_setup' => 'educations#post_first_time_setup'
	resources :educations

	get 'phone_numbers/first_time_setup' => 'phone_numbers#get_first_time_setup'
	post 'phone_numbers/first_time_setup' => 'phone_numbers#post_first_time_setup'
	resources :phone_numbers

	get 'addresses/first_time_setup' => 'addresses#get_first_time_setup'
	post 'addresses/first_time_setup' => 'addresses#post_first_time_setup'
	resources :addresses 

	get 'jobs/first_time_setup' => 'jobs#get_first_time_setup'
	post 'jobs/first_time_setup' => 'jobs#post_first_time_setup'
	resources :jobs

	get 'former_jobs/first_time_setup' => 'former_jobs#get_first_time_setup'
	post 'former_jobs/first_time_setup' => 'former_jobs#post_first_time_setup'
	resources :former_jobs

	get 'academic_awards/first_time_setup' => 'academic_awards#get_first_time_setup'
	post 'academic_awards/first_time_setup' => 'academic_awards#post_first_time_setup'
	resources :academic_awards

	get 'courses/first_time_setup' => 'courses#get_first_time_setup'
	post 'courses/first_time_setup' => 'courses#post_first_time_setup'
	resources :courses

	get 'languages/first_time_setup' => 'languages#get_first_time_setup'
	post 'languages/first_time_setup' => 'languages#post_first_time_setup'
	resources :languages

	# routes for Job_Applications, only custom routes here.
	resources :job_applications, only: [ :index, :show ] do
		member do
			post :student_applied
			post :student_unapplied
			post :company_hired
		end
	end
end
