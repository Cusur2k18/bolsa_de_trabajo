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


	resources :job_types
	resources :educations
	resources :phone_numbers
	resources :addresses
	resources :jobs
	resources :former_jobs
	resources :academic_awards
	resources :courses
	resources :languages


	# route for Job_Applications, only custom routes here.
	resources :job_applications, only: [ :index, :show ] do
		member do
			post :student_applied
			post :student_unapplied
			post :company_hired
		end
	end
end
