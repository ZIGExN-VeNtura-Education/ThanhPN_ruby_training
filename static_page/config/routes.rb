# frozen_string_literal: true

Rails.application.routes.draw do
  root 'static_pages#home'

  get '/help', to: 'static_pages#help', as: 'shit'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  # namespace scope in routes
  # So sanh scope / namespace trong route
  # So sanh res (s) va res (non s)
  # Co S them index
  # dung res them method
  # gioi han khong them method bang them lenh
  # %i = symbol
  # dung render trong controller de render view khac
  # Chuoi noi suy = "#{}"
  # Xoa tat ca khoang trang cuoi cung strip
  # Method chuoi
  # Turbo link chi reload thang nao can reload thang nao. tuy nhien option reload se reload toan bo trang
  # media type stylesheet tag
  # Tap trung core: Xu ly chuoi va hash, gem device
  # No focus test
end
