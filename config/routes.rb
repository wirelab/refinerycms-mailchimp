Refinery::Application.routes.draw do
  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :campaigns do
      collection do
        post :update_positions
      end
    end
  end
end
