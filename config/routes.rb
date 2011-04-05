Refinery::Application.routes.draw do
  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :campaigns do
      member do
        get :send_options
        post :send_test
        post :send_now
        post :schedule
        post :unschedule
      end
    end
  end
end
