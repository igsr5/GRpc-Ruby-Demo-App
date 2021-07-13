require 'grpc'
require_relative 'lib/calc_services_pb.rb'

def main
  stub =  Example::Calc::Stub.new('localhost:50051', :this_port_is_insecure)
  output = stub.slove(Example::Input.new(question: input))
  p "答えは#{output.answer}"
end

p "計算式を書いてください"
input = gets.chomp

main(input)
