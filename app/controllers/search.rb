require_relative "../models/search.rb"

post '/search' do 
  query = params[:search]
  @search = get_api_response(true,query)
  redirect '/users/' + session[:user_id].to_s
end