class CliRunner
  
  attr_accessor :mode

  def initialize(mode)
    @mode = mode
  end

  def hash(secret)
    if @mode == :ruby
      `./bcrypt-cli hash '#{secret}'`.chomp
    elsif @mode == :php
      `./bcrypt-cli-php hash '#{secret}'`.chomp
    end
  end

  def compare(hash, secret)
    if @mode == :ruby
      `./bcrypt-cli compare '#{hash}' '#{secret}'`.chomp
    elsif @mode == :php
      `./bcrypt-cli-php compare '#{hash}' '#{secret}'`.chomp
    end
  end

end
