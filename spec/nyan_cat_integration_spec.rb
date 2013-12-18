require 'minitest/autorun'
require 'minitest/spec'

require 'nyan_cat'

describe NyanCat do
  before do
    @cat = NyanCat.new_cat
    @cat_art1 = (<<'END').strip
-_-_-_-_-_-_- ,------,
_-_-_-_-_-_-_ |   /\_/\
-_-_-_-_-_-_-~|__( ^ .^)
_-_-_-_-_-_-_ ""  ""
END
    @cat_art2 = (<<'END').strip
_-_-_-_-_-_-_ ,------,
-_-_-_-_-_-_- |   /\_/\
_-_-_-_-_-_-_^|__( ^ .^)
-_-_-_-_-_-_-  ""  ""
END
  end

  describe "#tick" do
    it "returns an ascii cat" do
      result = @cat.tick.strip
      result.must_equal @cat_art1
    end

    it "returns an animated cat with repeated calls" do
      @cat.tick
      result = @cat.tick.strip
      result.must_equal @cat_art2
    end

    it "animates the cat based on frame number" do
      result = @cat.tick(1).strip
      result.must_equal @cat_art2
    end
  end
end