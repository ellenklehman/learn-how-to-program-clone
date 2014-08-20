Rails.application.routes.draw do
  match('/table-of-contents', {:via => :get, :to => 'lessons#index'})
end
