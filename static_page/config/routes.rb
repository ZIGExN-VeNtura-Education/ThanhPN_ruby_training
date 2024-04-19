Rails.application.routes.draw do
  resources :books
  get "static_pages/home"
  get "static_pages/help"
  get "static_pages/about"
  get "static_pages/contact"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "static_pages#home"

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
