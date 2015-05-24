# coding: utf-8
d = Dir.pwd+"/*.org"
Dir[d].each { |x|
  puts "handle #{x}<br/>"
  `./org2html.sh #{x}`
}
