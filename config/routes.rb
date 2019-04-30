Rails.application.routes.draw do
  get '/', to: 'owners#home', as: 'home'
  get 'owners/petless_owners', to: 'owners#petless_owners', as: 'petless_owners'
  get 'pets/ownerless_pets', to: 'pets#ownerless_pets', as: 'ownerless_pets'
  resources :pets
  resources :owners
end
