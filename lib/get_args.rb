require 'extlib'

$:.push(File.dirname(__FILE__))

if RUBY_PLATFORM == "java"
  require 'jruby_args'
elsif RUBY_VERSION < "1.9"
  require 'mri_args'
else
  require 'vm_args'
end

class UnboundMethod
  include GetArgs
end

class Method
  include GetArgs
end

