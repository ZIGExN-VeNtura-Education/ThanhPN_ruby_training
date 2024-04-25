# frozen_string_literal: true

Rails.application.routes.draw do
  root "static_pages#home"

  get "/help", to: "static_pages#help", as: "shit"
  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"
  get "/signup", to: "users#new"
  get "/login", to: "session#new"
  post "/login", to: "session#create"
  delete "/logout", to: "session#destroy"
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # namespace scope in routes x
  # So sanh scope / namespace trong route x
  # So sanh res (s) va res (non s) x
  # Co S them index x
  # dung res them method x
  # gioi han khong them method bang them lenh except/only x
  # %i = symbol
  # dung render trong controller de render view khac x
  # Chuoi noi suy = "#{}" x
  # Xoa tat ca khoang trang cuoi cung strip x
  # Method chuoi
  # Turbo link chi reload thang nao can reload thang nao. tuy nhien option reload se reload toan bo trang x
  # media type stylesheet tag
  # Tap trung core: Xu ly chuoi va hash, gem devise
  # No focus test
end
