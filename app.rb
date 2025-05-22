require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:home)
end

get("/square/new") do
  erb(:square)
end

get("/square_root/new") do
  erb(:square_root)
end

get("/payment/new") do
  erb(:payment)
end

get("/random/new") do
  erb(:random)
end

get("/square/results") do
  @number = params.fetch("number")

  erb(:square_results)
end

get("/square_root/results") do
  @user_number = params.fetch("user_number")

  erb(:square_root_results)
end

get("/payment/results") do
  @apr = params.fetch("user_apr").to_f
  @user_years = params.fetch("user_years").to_f
  @user_pv = params.fetch("user_pv").to_f

  monthly_interest =  @apr / 100 / 12
  total_payments = @user_years * 12
  @payment = @user_pv * (monthly_interest * (1 + monthly_interest)**total_payments) / 
             ((1 + monthly_interest)**total_payments - 1)
  @payment = @payment.round(2)

  erb(:payment_results)
end

get("/random/results") do
  @user_min = params.fetch("user_min")
  @user_max = params.fetch("user_max")

  erb(:random_results)
end
