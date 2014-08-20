Rails.application.routes.draw do
  match('/table-of-contents', {:via => :get, :to => 'lessons#index'})
  match('/admin', {:via => :get, :to => 'lessons#admin'})
  match('/admin', {:via => :post, :to => 'lessons#create'})
  match('/admin/:id', {:via => [:patch, :put], :to => 'lessons#edit'})
  match('/admin/:id', {:via => :get, :to => 'lessons#show'})
  match('/admin/:id', {:via => :delete, :to => 'lessons#destroy'})
end
