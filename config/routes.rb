Rails.application.routes.draw do
  match('/', {:via => :get, :to => 'lessons#index'})
  match('/admin', {:via => :get, :to => 'lessons#admin'})
  match('/lessons', {:via => :post, :to => 'lessons#create'})
  match('/sections', {:via => :post, :to => 'sections#create'})
  match('/chapters', {:via => :post, :to => 'chapters#create'})
  match('/lessons/:id', {:via => [:patch, :put], :to => 'lessons#update'})
  match('/admin/:id', {:via => :get, :to => 'lessons#show'})
  match('/admin/:id', {:via => :delete, :to => 'lessons#destroy'})
  match('/:name', {:via => :get, :to=> 'lessons#display'})
end
