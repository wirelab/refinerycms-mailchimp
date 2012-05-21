Refinery::Core::Engine.routes.draw do
  namespace :mailchimp, :path => '' do
    namespace :admin, :path => 'refinery' do
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
end
