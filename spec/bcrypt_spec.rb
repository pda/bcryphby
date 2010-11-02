describe 'bcrypt' do

  def hash(secret)
    `./bcrypt hash '#{secret}'`.chomp
  end

  def compare(hash, secret)
    `./bcrypt compare '#{hash}' '#{secret}'`.chomp
  end

  describe 'hash' do

    it 'returns a string' do
      hash('blarg').class.should == String
    end

    it 'returns a string with valid prefix' do
      hash('blarg')[0..6].should == '$2a$10$'
    end

  end

  describe 'compare' do

    it 'passes on round-trip comparison' do
      compare(hash('blarg'), 'blarg').should == 'true'
    end

    it 'fails on random comparison' do
      compare(hash('blarg'), 'meh').should == 'false'
    end

  end

end
