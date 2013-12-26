require 'minitest/autorun'
require 'minitest/spec'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'nyan-cat'

describe NyanCat do
  before do
    @cat = NyanCat.new_cat(:colorize => false)
    @cat_frame_1 = (<<'END').strip
-_-_-_-_-_,------,
_-_-_-_-_-|   /\_/\
-_-_-_-_-~|__( ^ .^)
_-_-_-_-_-""  ""
END
    @cat_frame_2 = (<<'END').strip
_-_-_-_-_-,------,
-_-_-_-_-_|   /\_/\
_-_-_-_-_^|__( ^ .^)
-_-_-_-_-_ ""  ""
END
  end

  describe "#tick" do
    it "returns an ascii cat" do
      result = @cat.tick.strip
      result.must_equal @cat_frame_1
    end

    it "returns an animated cat with repeated calls" do
      @cat.tick
      result = @cat.tick.strip
      result.must_equal @cat_frame_2
    end

    it "animates the cat based on frame number" do
      result = @cat.tick(1).strip
      result.must_equal @cat_frame_2
    end

    describe "when colorizing the trail" do

      # this is just a punt since matching the whole string with the colors
      # is a bit of pain.  So instead we just use a simple regex to match
      # against a specific color.  We're not really validating that the colors
      # are correct or anything.  Just that they are populated.
      it "should add colors to the trail" do
        cat = NyanCat.new_cat(:colorize => true)
        result = cat.tick.strip
        result.must_match(/154m-/)
      end
    end
  end
end
