require 'paint'

module NyanCat
  FRAME1 = <<'END'
_,------,
-|   /\_/\
~|__( ^ .^)
-""  ""
END

  FRAME2 = <<'END'
-,------,
_|   /\_/\
^|__( ^ .^)
_ ""  ""
END

  class Cat
    def initialize(opts = {})
      @frames         = opts.fetch(:frames) { [FRAME1, FRAME2] }
      @trail_length   = opts.fetch(:trail_length) { 9 }
      @colorize_trail = opts.fetch(:colorize) { true }
      @frame_count    = 0
    end

    def tick(frame_count = @frame_count)
      increment_internal_frame_count
      generate_cat(frame_count)
    end

    private

    def increment_internal_frame_count
      @frame_count += 1
    end

    def generate_cat(frame_count)
      index = frame_count % @frames.count
      frame = @frames[index]
      frame_with_trail = add_trail_to_each_line(frame, index)
    end

    def add_trail_to_each_line(frame, index)
      lines = frame.split(/\r?\n/)
      frame_with_trails = lines.map.with_index do |line, i|
        @trail_length.times do |j|
          if @colorize_trail
            color_index = j - @frame_count % @trail_length
            line.prepend(Paint[trail_char(index, i, j), rainbow(color_index)])
          else
            line.prepend(trail_char(index, i, j))
          end
        end
        line
      end

      frame_with_trails.join("\n")
    end

    def rainbow(freq = 0.3, i)
      red   = Math.sin(freq*i + 0) * 127 + 128
      green = Math.sin(freq*i + 2*Math::PI/3) * 127 + 128
      blue  = Math.sin(freq*i + 4*Math::PI/3) * 127 + 128
      "#%02X%02X%02X" % [ red, green, blue ]
    end

    def trail_char(frame_index, line_index, trail_index)
      ((frame_index + line_index + trail_index) % 2).zero? ? '-' : '_'
    end
  end
end
