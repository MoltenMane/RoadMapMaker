Rails.application.routes.draw do
  devise_for :admins
  devise_for :user
  devise_scope :user do
    get '/user/sign_out(.:format)' => 'devise/sessions#destroy'
  end

  resources :projects, controller: 'projects' do
    resources :problems, controller: 'projects/problems' do
      resources :counteractions, controller: 'projects/problems/counteractions' 
    end
    resources :wbs, controller: 'projects/wbs' do
      get '/draw' => 'projects/wbs#draw'
    end
  end



  root 'projects#index'
  




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
