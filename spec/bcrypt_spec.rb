describe 'bcrypt' do

  describe 'hash' do

    def hash_blarg
      `./bcrypt hash blarg`
    end

    it 'returns a string' do
      hash_blarg.class.should == String
    end

    it 'returns a string with valid prefix' do
      hash_blarg[0..6].should == '$2a$10$'
    end

    it 'returns a string ending in a unix newline' do
      hash_blarg[-1].should == "\n"
    end

  end

end
