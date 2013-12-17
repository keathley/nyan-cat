class NyanCat

  FRAME1 = <<'END'
-_-_-_-_-_-_-_,------,
_-_-_-_-_-_-_-|   /\_/\
-_-_-_-_-_-_-~|__( ^ .^)
_-_-_-_-_-_-_-""  ""
END

  FRAME2 = <<'END'
_-_-_-_-_-_-_-,------,
-_-_-_-_-_-_-_|   /\_/\
_-_-_-_-_-_-_^|__( ^ .^)
-_-_-_-_-_-_-_ ""  ""
END

  def render
    loop do
      frames.each do |frame|
        render_frame(frame)
      end
    end
  end

  private

  def frames
    [FRAME1, FRAME2]
  end

  def render_frame(frame)
    clear_screen
    puts frame
    delay_next_render
  end

  def delay_next_render
    sleep (1.0/8.0)
  end

  def clear_screen
    puts "\e[H\e[2J"
  end
end
