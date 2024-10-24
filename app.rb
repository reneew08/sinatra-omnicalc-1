require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:square)
end

get("/square/new") do
  erb(:square)
end

get("/square/results") do
  @params
  @square_number = params.fetch("square_number").to_f
  @squared_number=(@square_number)**2
  erb(:square_result)
end

get("/square_root/new") do
  erb(:squareroot)
end

get("/square_root/results") do
  @squareroot_number = params.fetch("squareroot_number").to_f
  @squarerooted_number=(@squareroot_number)**0.5
  erb(:squareroot_result)
end

get("/payment/new") do
  erb(:payment)
end

get("/payment/results") do
  @user_apr = params.fetch("user_apr").to_f
  @c_apr=(@user_apr/100)/12
  @user_years = params.fetch("user_years").to_i
  @c_years=@user_years*12
  @user_pv = params.fetch("user_pv").to_f
  @monthly_payment=(@c_apr*@user_pv)/(1-((1+@c_apr)**(-@c_years)))
  erb(:payment_result)
end
