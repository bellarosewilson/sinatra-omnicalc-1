require 'sinatra'
require 'sinatra/reloader'

def roll_dice(num_dice, num_sides)
  Array.new(num_dice) { rand(1..num_sides) }
end

def calculate_square(number)
  number ** 2
end

def calculate_square_root(number)
  Math.sqrt(number)
end

def random_number(min, max)
  rand(min..max)
end

def calculate_payment(apr, years, principal)
  monthly_rate = (apr / 100) / 12
  months = years * 12
  (principal * monthly_rate) / (1 - (1 + monthly_rate) ** -months)
end

get '/' do
  erb :index
end

get '/square/new' do
  erb :square
end

get '/square/results' do
  @number = params[:number].to_f
  @result = calculate_square(@number)
  erb :square_results
end

get '/square_root/new' do
  erb :square_root
end

get '/square_root/results' do
  @number = params[:number].to_f
  @result = calculate_square_root(@number)
  erb :square_root_results
end

get '/random/new' do
  erb :random
end

get '/random/results' do
  @min = params[:user_min].to_f
  @max = params[:user_max].to_f
  @result = random_number(@min, @max)
  erb :random_results
end

get '/payment/new' do
  erb :payment
end

get '/payment/results' do
  @apr = params[:apr].to_f
  @years = params[:years].to_i
  @principal = params[:principal].to_f
  @monthly_payment = calculate_payment(@apr, @years, @principal)
  erb :payment_results
end
