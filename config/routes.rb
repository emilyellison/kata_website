KataWebsite::Application.routes.draw do

  get 'simple_website/home' => 'simple_website#home', as: :simple_website_home

end
