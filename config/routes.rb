Rails.application.routes.draw do
  # devise routes
	# since we defined custom controllers we need to specify all of the routes 
  devise_for :students, path: 'students', controllers: { sessions: 'students/sessions', 
																												 registrations: 'students/registrations', 
																												 confirmations: 'students/confirmations', 
																												 unlocks: 'students/unlocks', 
																												 passwords: 'students/passwords', 
																												 omniauth: 'students/omniauth' }

	devise_for :companies, path: 'companies', controllers: { sessions: 'companies/sessions', 
																													registrations: 'companies/registrations', 
																													confirmations: 'companies/confirmations', 
																													unlocks: 'companies/unlocks', 
																													passwords: 'companies/passwords', 
																													omniauth: 'companies/omniauth' }
	# Non devise routes
	resources :students, only: [:show], :controller => "students_dashboard"
	scope '/students' do
    get 'dashboard', to: 'students_dashboard#index', as: :student_dashboard
  end
	# authenticated users paths.
	authenticated :student do
    root 'students_dashboard#index', as: :authenticated_student_root
  end

	authenticated :company do
    root 'companies_dashboard#index', as: :authenticated_company_root
  end

	unauthenticated :student do 
		root "home#index"	
	end

	unauthenticated :company do 
		root "home#index"	
	end

	root "home#index"
end
