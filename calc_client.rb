require 'grpc'
require_relative 'lib/calc_services_pb.rb'

def main(input)
  stub =  Example::Calc::Stub.new('localhost:50051', :this_channel_is_insecure)
  output = stub.solve(Example::InputRequest.new(question: input))
  puts "答えは#{output.answer}"
end

puts "計算式を書いてください"
input = gets.chomp

main(input)
