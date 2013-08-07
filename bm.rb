require 'ap'
require 'benchmark'
include Benchmark

class Fu
  def this
    "that"
  end
end
fu = Fu.new
hsh = {:this => "that"}

n = 10000000
 

Benchmark.bmbm do |x|
    x.report(:hash)    { n.times {fu.this} }
    x.report(:method)  { n.times {hsh[:this]} }
end
