require "minitest/autorun"
require 'app/name_origin'

describe NameOrigin do
  describe "#guess" do
    describe "with a German name" do
      it "return 'DE'" do
        name_origin = NameOrigin.new('Müller')

        name_origin.guess.must_equal('Müller')
      end
    end
  end
end
