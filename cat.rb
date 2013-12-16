FRAME1 = <<'END'
-_-_-_-_-_-_-_,------,
_-_-_-_-_-_-_-|   /\_/\
-_-_-_-_-_-_-~|__( ^ .^)
_-_-_-_-_-_-_-""  ""
END

FRAME2 = <<'END'
_-_-_-_-_-_-_-,------,
-_-_-_-_-_-_-_|   /\_/\
_-_-_-_-_-_-_~|__( ^ .^)
-_-_-_-_-_-_-_" " " "
END

class Cat
  def initialize(*frames)
    @frames = frames
  end

  def render
    loop do
      @frames.each do |frame|
        render_frame(frame)
      end
    end
  end

  private

  def render_frame(frame)
    puts frame
    delay_next_render
    clear_screen
  end

  def delay_next_render
    sleep (1.0/8.0)
  end

  def clear_screen
    puts "\e[H\e[2J"
  end
end

Cat.new(FRAME1, FRAME2).render