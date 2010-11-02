class CliRunner
  
  attr_accessor :mode

  def initialize(mode)
    @mode = mode
  end

  def hash(secret)
    if @mode == :ruby
      `./bcrypt hash '#{secret}'`.chomp
    end
  end

  def compare(hash, secret)
    if @mode == :ruby
      `./bcrypt compare '#{hash}' '#{secret}'`.chomp
    end
  end

end
