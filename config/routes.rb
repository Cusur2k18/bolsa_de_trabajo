Rails.application.routes.draw do
	# devise route
	devise_for :users

	devise_scope :user do
		get 'students/sign_up' => 'student_registrations#new'
		post 'students/sign_up' => 'student_registrations#create'
		
		get 'companies/sign_up' => 'company_registrations#new'
		post 'companies/sign_up' => 'company_registrations#create'

		get 'login', to: 'devise/sessions#new'
		delete 'logout', to: 'devise/sessions#destroy'

	end

	# all other routes
	root "home#index"
	get 'student_dashboard', to: 'students_dashboard#index'
	get 'companies_dashboard', to: 'companies_dashboard#index'

	resources :students, only: [ :edit, :update, :delete ]
	resources :companies, only: [ :edit, :update, :delete ]
	resources :admins, only: [ :edit, :update, :delete ]
	resources :educations
end
