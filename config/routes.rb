Rails.application.routes.draw do
  # devise routes
  devise_for :students, path: 'students', controllers: { sessions: 'students/sessions', 
																												 registrations: 'students/registrations', 
																												 confirmations: 'students/confirmations', 
																												 unlocks: 'students/unlocks', 
																												 passwords: 'students/passwords'}

	devise_for :companies, path: 'companies', controllers: { sessions: 'companies/sessions', 
																													registrations: 'companies/registrations', 
																													confirmations: 'companies/confirmations', 
																													unlocks: 'companies/unlocks', 
																													passwords: 'companies/passwords' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
