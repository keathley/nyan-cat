module NyanCat
  class UI
    def initialize(cat)
      @cat = cat
    end

    def render
      loop do
        render_frame(@cat.tick)
      end
    end

    private

    def render_frame(frame)
      printf frame
      delay_next_render
      clear_screen(frame)
    end

    def delay_next_render
      sleep (1.0/8.0)
    end

    def clear_screen(frame)
      length = (frame.split("\n").length - 1)
      printf "\e[1A" * length + "\r"
    end
  end
end
