module GetArgs
  class ArgumentList
    def initialize(args_array)
      @arguments = args_array.map { |arg| Argument.new(arg) }
    end
  
    def method_missing(*args, &block)
      @arguments.send(*args, &block)
    end
  end

  class Argument
    attr_reader :name, :default
  
    def initialize(arg_array)
      @optional = arg_array.length > 1
      @name, @default = *arg_array
    end
  
    def optional?
      @optional
    end
    
    def multiple?
      name.to_s.slice(0,1) == '*'
    end
    
    def to_s
      name
    end
  end
end