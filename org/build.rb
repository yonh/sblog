# coding: utf-8
d = Dir.pwd+"/*.org"
Dir[d].each { |x|
	`./org2html.sh #{x}`
}
