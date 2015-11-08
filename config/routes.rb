Rails.application.routes.draw do
  get 'correct_lists/index'

  resource :file_imports do
    collection {post :import }
  end
  get 'file_imports/historique'
  root 'file_imports#index'

end
