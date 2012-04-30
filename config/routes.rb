ActionController::Routing::Routes.draw do |map|
  map.resources :advertisements, :member => { :redirect => :get }
  map.root :controller => 'static', :action => 'index'
  map.connect 'post/show/:id/:tag_title', :controller => 'post', :action => 'show', :requirements => {:id => /\d+/}
  map.connect 'pool/zip/:id/:filename', :controller => 'pool', :action => 'zip', :requirements => {:id => /\d+/, :filename => /.*/}
  map.connect ':controller/:action/:id.:format', :requirements => {:id => /[-\d]+/}
  map.connect ':controller/:action/:id', :requirements => {:id => /[-\d]+/}
  map.connect ':controller/:action.:format'
  map.connect ':controller/:action'

  map.connect 'histogram', :controller => 'post', :action => 'histogram'
  map.connect 'download', :controller => 'post', :action => 'download'
end
