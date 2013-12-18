module NyanCat
  FRAME1 = <<'END'
-_-_-_-_-_-_- ,------,
_-_-_-_-_-_-_ |   /\_/\
-_-_-_-_-_-_-~|__( ^ .^)
_-_-_-_-_-_-_ ""  ""
END

  FRAME2 = <<'END'
_-_-_-_-_-_-_ ,------,
-_-_-_-_-_-_- |   /\_/\
_-_-_-_-_-_-_^|__( ^ .^)
-_-_-_-_-_-_-  ""  ""
END

  def self.new_cat(*args)
    Cat.new(*args)
  end

  class Cat
    def initialize(opts = {})
      @frames = opts.fetch(:frames) { [FRAME1, FRAME2] }
      @frame_count = 0
    end

    def tick(frame_count = nil)
      if frame_count.nil?
        frame_count = @frame_count
        @frame_count += 1
      end

      generate_cat(frame_count)
    end

    private

    # Take the cat frame
    # Break up the individual lines
    # For each line add a trail to the beginning of it
    # Return that specific image

    # When we need to add color to the trail then we create a color based on
    # line index and the position index and the frame count index
    # This allows us to output a rainbow sine wave of color for the trail
    # We can use paint for that I believe

    def generate_cat(frame_count)

      # Find the current index
      index = frame_count % @frames.count
      @frames[index]

      # Generate the trail for each line in the cat art

      # Output each line then return to the beginning so we don't have to clear
      # the screen
    end
  end

end