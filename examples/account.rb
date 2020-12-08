require_relative "example_helper"

@client = Example::CLIENT

puts "Account Balance"
puts @client.account.balance

puts "Access Token"
puts @client.account.token(token: 100)

puts "Tariff"
puts @client.account.tariff

