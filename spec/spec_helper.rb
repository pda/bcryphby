class CliRunner
  
  attr_accessor :mode

  def initialize(mode)
    @mode = mode
  end

  def hash(secret)
    if @mode == :ruby
      `ruby -rubygems bcrypt-cli hash '#{secret}'`.chomp
    elsif @mode == :php
      `php bcrypt-cli-php hash '#{secret}'`.chomp
    end
  end

  def compare(hash, secret)
    if @mode == :ruby
      `ruby -rubygems bcrypt-cli compare '#{hash}' '#{secret}'`.chomp
    elsif @mode == :php
      `php bcrypt-cli-php compare '#{hash}' '#{secret}'`.chomp
    end
  end

end
