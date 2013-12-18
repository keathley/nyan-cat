class UI
  def initialize(cat)
    @cat = cat
  end

  def render
    loop do
      @cat.tick
    end
  end

  private

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
