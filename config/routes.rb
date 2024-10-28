Rails.application.routes.draw do
  get("/", { :controller => "calculations", :action => "home" })
  
  get("/square/new", { :controller => "calculations", :action => "new_square" })
  get("/square/results", { :controller => "calculations", :action => "square" })
  
  get("/square_root/new", { :controller => "calculations", :action => "new_square_root" })
  get("/square_root/results", { :controller => "calculations", :action => "square_root" })
  
  get("/random/new", { :controller => "calculations", :action => "new_random" })
  get("/random/results", { :controller => "calculations", :action => "random" })
  
  get("/payment/new", { :controller => "calculations", :action => "new_payment" })
  get("/payment/results", { :controller => "calculations", :action => "payment" })
end
