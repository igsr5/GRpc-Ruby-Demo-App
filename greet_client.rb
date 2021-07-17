require 'grpc'
require './lib/calc_services_pb.rb'

def main(name, time)
  stub = Example::Greeting::Stub.new('localhost:50051', :this_channel_is_insecure)
  output = stub.greet(Example::GreetRequest.new(name: name, time: time))
  puts output.ans
end

puts '名前は？'
name = gets.chomp

puts '今の時間は？'
puts '0: 朝'
puts '1: 昼'
puts '2: 夜'

time = gets.chomp.to_i

main(name, time)
