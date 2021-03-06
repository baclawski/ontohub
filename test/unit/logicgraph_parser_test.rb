require 'test_helper'

class LogicgraphParserTest < ActiveSupport::TestCase

  context "LogicgraphParser" do

    context 'parsing empty XML' do
      setup do
        @symbols = []
        OntologyParser.parse open_fixture('empty.xml'),
          symbol: Proc.new{ |h| @symbols << h }
      end
      
      should 'not find any symbol' do
        assert_equal 0, @symbols.count
      end
    end

    context 'parsing invalid XML' do
      should 'not throw an exception' do
        OntologyParser.parse open_fixture('broken.xml'), {}
        assert true
      end
    end

  end
  
  def open_fixture(name)
    File.open("#{Rails.root}/test/fixtures/ontologies/xml/#{name}")
  end

end
