require 'grpc'
require_relative 'lib/calc_services_pb.rb'

class CalcServer < Example::Calc::Service
  def solve(input, _unused_call)
    answer = eval(input.question)

    return Example::OutputResponse.new(answer: answer)
  end
end


