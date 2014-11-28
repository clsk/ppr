match '/importer/index', :to => 'importer#index', :via => [:get, :post]
match '/importer/match', :to => 'importer#match', :via => [:get, :post]
match '/importer/result', :to => 'importer#result', :via => [:get, :post]

resources :user_schedule_entry do
    member do
        get 'create2'
    end
end
