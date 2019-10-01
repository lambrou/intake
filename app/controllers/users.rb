require 'chartkick'

get '/users/new' do
  if session[:user_id]
    @user = User.find(session[:user_id])
    redirect "/users/#{@user.id}"
  else
    erb :index
  end
end

post '/users/new' do
  @user = User.new(name: params[:name], email: params[:email])
  @user.password = params[:password_plaintext]
  if @user.save
    session[:user_id] = @user.id
    redirect '/users/' + session[:user_id].to_s
  else
    @errors = @user.errors.full_messages
    erb :index
  end
end

get '/caldata' do
  #@logged_in_as = User.find(session[:user_id]) if session[:user_id]
  #@logged_in_as.calorieHistory.to_json
  datatest = {'2013-01-01' => 1, '2013-01-02' => 2, '2013-01-3' => 3, '2013-01-04' => 4, '2013-01-05' => 5, '2013-01-06' => 12}
  datatest.to_json

end

get '/users/:user_id' do
  @logged_in_as = User.find(session[:user_id]) if session[:user_id]
  @viewing_user = User.find(params[:user_id])
  if @logged_in_as && @logged_in_as.id == @viewing_user.id
    if @logged_in_as.timestampHistory
      @graph_dates = @logged_in_as.timestampHistory
    else
      @graph_dates = "['0']"
    end

    if @logged_in_as.calorieHistory
      @calorie_values = @logged_in_as.calorieHistory
    else
      @calorie_values = "['0']"
    end
    if @logged_in_as.weightHistory
      @weight_values = @logged_in_as.weightHistory
    else
      @weight_values = "['0']"
    end
    erb :user
  else
    erb :not_authorized
  end
  

end

post '/users/:user_id' do
  @logged_in_as = User.find(session[:user_id]) if session[:user_id]
  @viewing_user = User.find(params[:user_id])

  if @logged_in_as && @logged_in_as.id == @viewing_user.id
    erb :user
  else
    erb :not_authorized
  end

  @user = User.find(session[:user_id])

  if params[:weight]
    bmrl = { "Sedentary" => 1.2, "Lightly Active" => 1.375, "Moderately Active" => 1.55, "Very Active" => 1.725, "Highly Active" => 1.9 }
    bmi = (params[:weight].to_f/(params[:height].to_f**2) * 703.0)
    bmr = 0
    if params[:sex]
      @user.sex = params[:sex]
    end
    if @user.sex or params[:sex]
      if @user.sex == 'Male'
        bmr = (66 + (6.3 * params[:weight].to_f) + (params[:height].to_f * 12.9) - (6.8 * params[:age].to_f))
      else
        bmr = (655 + (4.3 * params[:weight].to_f) + (params[:height].to_f * 4.7) - (4.7 * params[:age].to_f))
      end
    end

    @user.bmi = '%.2f' % bmi
    @user.bmr = bmr
    
    if params[:lifestyle]
      @user.lifestyle = params[:lifestyle]
    end

    @user.maxcal = (bmr * bmrl[@user.lifestyle]) - 500
    @user.age = params[:age]
    @user.weight = params[:weight]
    @user.tweight = params[:tweight]
    @user.height = params[:height]

  end

  if params[:calcontent]
    @user.calories = @user.calories + params[:calcontent].to_i
    @user.carbs = @user.carbs + params[:carbcontent].to_i
    @user.fat = @user.fat + params[:fatcontent].to_i
  end
  
  if @user.save
    redirect '/users/' + session[:user_id].to_s
  end
end
