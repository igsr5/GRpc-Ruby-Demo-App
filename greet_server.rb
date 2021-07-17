require 'grpc'
require './lib/calc_services_pb.rb'

class GreetServer < Example::Greeting::Service
  def greet(input, _unused_call)
    ans = "#{input.name}さん"
    case input.time
    when :MORNING
      ans += '、おはようございます'
    when :NOON
      ans += '、こんにちは'
    when :NIGHT
      ans += '、こんばんわ'
    else
      ans += 'いつ'
    end
    return Example::GreetResponse.new(ans: ans)
  end
end
