Rails.application.routes.draw do
  post "/students" => "students#create"
  get "/students/:id" => "students#show"
  get "/students" => "students#index"
  patch "/students/:id" => "students#update"
  delete "/students/:id" => "students#destroy"
end
