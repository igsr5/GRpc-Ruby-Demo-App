require './calc_server.rb'
require './greet_server.rb'

def main
  s = GRPC::RpcServer.new
  s.add_http2_port('0.0.0.0:50051', :this_port_is_insecure)
  s.handle(CalcServer)
  s.handle(GreetServer)
  puts 'start grpc server!!'
  puts 'Use Ctrl-C to stop'
  s.run_till_terminated_or_interrupted([1, 'int', 'SIGQUIT'])
end

main
