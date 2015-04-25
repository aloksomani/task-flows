Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  
  # staticpages controller
  root "static_pages#index", as: :home

  # users controller routes
  get "users" => "users#index"                 # shows all users
  get "signup" => "users#new", as: :signup   # signup form for new user
  post "users" => "users#create"               # creates new user when form is submitted
  get "users/:id" => "users#show", as: :user   # single user show page, shows profile


  # session/login controller routes
  get "login" => "sessions#new", as: :login
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy", as: :logout


  # All projects controller routes
  get "users/:id/projects" => "projects#index", as: :user_projects
  get "users/:id/projects/new" => "projects#new", as: :new_user_project
  post "users/:id/projects" => "projects#create", as: :user_projects_create
  get "users/:user_id/projects/:id" => "projects#show", as: :user_project
  get "users/:user_id/projects/:id/edit" => "projects#edit", as: :project_edit
  patch "users/:user_id/projects/:id" => "projects#update"
  delete "users/:user_id/projects/:id" => "projects#destroy"


  # All milestones controller routes
  get "users/:user_id/projects/:id/milestones/new" => "milestones#new", as: :new_project_milestone
  post "users/:user_id/projects/:id" => "milestones#create", as: :project_milestones
  get "users/:user_id/projects/:project_id/milestones/:id" => "milestones#show", as: :project_milestone
  get "users/:user_id/projects/:project_id/milestones/:id/edit" => "milestones#edit", as: :milestone_edit
  patch "users/:user_id/projects/:project_id/milestones/:id"  => "milestones#update"
  delete "users/:user_id/projects/:project_id/milestones/:id" => "milestones#destroy"


  # All task controller routes
  get "users/:user_id/projects/:id/milestones/:id/tasks/new" => "tasks#new", as: :new_task
  post "users/:user_id/projects/:id/milestones/:id" => "tasks#create", as: :tasks
  get "users/:user_id/projects/:id/milestones/:id/tasks/:id/edit" => "tasks#edit", as: :task_edit
  delete "users/:user_id/projects/:id/milestones/:id/tasks/:id" => "tasks#destroy"
  patch "tasks/:id" => "tasks#update"
  get "tasks/:id" => "tasks#show", as: :task


end
