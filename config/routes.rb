# config/routes.rb
Rails.application.routes.draw do
  root 'imc_records#index' # Define a rota padrão para a página da sua API
  resources :imc_records, only: %i[index create]
end
