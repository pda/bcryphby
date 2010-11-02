describe 'bcryphtuby CLI interface to bcrypt-ruby' do

  def hash(secret)
    `./bcrypt hash '#{secret}'`.chomp
  end

  def compare(hash, secret)
    `./bcrypt compare '#{hash}' '#{secret}'`.chomp
  end

  describe 'the hash command' do

    it 'outputs a string' do
      hash('blarg').class.should == String
    end

    it 'outputs a string with valid prefix' do
      hash('blarg')[0..6].should == '$2a$10$'
    end

    it 'outputs a string of the correct length' do
      hash('blarg').length == 60
    end

  end

  describe 'the compare command' do

    it 'outputs true for valid comparison' do
      compare(hash('blarg'), 'blarg').should == 'true'
    end

    it 'outputs false for invalid comparison' do
      compare(hash('blarg'), 'meh').should == 'false'
    end

  end

end
