require 'minitest/autorun'
require 'app/name_origin'

describe NameOrigin do
  describe '#guess' do
    describe 'with a German name' do
      it "return ['DE']" do
        name_origin = NameOrigin.new('Müller')

        _(name_origin.guess).must_equal(['DE'])
      end
    end

    describe 'with a name belonging to serveral countries' do
      it 'return the array of possibility' do
        name_origin = NameOrigin.new('Lange')

        _(name_origin.guess).must_equal(['DE', 'NL'])
      end
    end
  end

  describe 'with a unknown name' do
    it 'return an empty array' do
      name_origin = NameOrigin.new('Mysteryname')

      _(name_origin.guess).must_equal([])
    end
  end

  describe 'with special character' do
    it "return an empty array" do
      name_origin = NameOrigin.new('My$teryn!@e1234')

      _(name_origin.guess).must_equal([])
    end
  end

  describe 'with special capitalization' do
    it 'return a match if any' do
      name_origin = NameOrigin.new('marTIn')

      _(name_origin.guess).must_equal(['DE'])
    end
  end
end
