require 'spec_helper.rb'

describe 'bcryphtuby CLI interface to bcrypt-ruby' do

  cli = CliRunner.new(:ruby)

  describe 'the hash command' do

    it 'outputs a string' do
      cli.hash('blarg').class.should == String
    end

    it 'outputs a string with valid prefix' do
      cli.hash('blarg')[0..6].should == '$2a$10$'
    end

    it 'outputs a string of the correct length' do
      cli.hash('blarg').length == 60
    end

  end

  describe 'the compare command' do

    it 'outputs true for valid comparison' do
      cli.compare(cli.hash('blarg'), 'blarg').should == 'true'
    end

    it 'outputs false for invalid comparison' do
      cli.compare(cli.hash('blarg'), 'meh').should == 'false'
    end

  end

end
