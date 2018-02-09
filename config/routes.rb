Rails.application.routes.draw do
	# devise route
	devise_for :users, :controllers => { :registrations =>  "registrations" }

	devise_scope :user do
		get 'student/sign_up' => 'registrations#new_student'
		post 'student/sign_up' => 'registrations#create_student'
		
		get 'company/sign_up' => 'registrations#new_company'
		post 'company/sign_up' => 'registrations#create_company'

		get 'admin/sign_up' => 'registrations#new_admin'
		post 'admin/sign_up' => 'registrations#create_admin'
	end

	# all other routes
	root "home#index"
	get 'student_dashboard', to: 'students_dashboard#index'
	get 'companies_dashboard', to: 'companies_dashboard#index'

	resources :students
	resources :companies
	resources :admins
end
