match '/importer/index', :to => 'importer#index', :via => [:get, :post]
match '/importer/match', :to => 'importer#match', :via => [:get, :post]
match '/importer/result', :to => 'importer#result', :via => [:get, :post]

resources :user_schedule_entry do
    member do
        post 'CreateScheduleEntries'
    end
end
<<<<<<< HEAD

resources :user_schedule_exception do
    member do
        post 'create2'
    end
end
=======
>>>>>>> user_schedule
