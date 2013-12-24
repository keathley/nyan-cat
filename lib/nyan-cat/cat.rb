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
      @frames       = opts.fetch(:frames) { [FRAME1, FRAME2] }
      @trail_length = opts.fetch(:trail_length) { 9 }
      @frame_count  = 0
    end

    def tick(frame_count = nil)
      frame_count ||= @frame_count
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
          line.prepend(trail_char(index, i, j))
        end
        line
      end
      frame_with_trails.join("\n")
    end

    def trail_char(frame_index, line_index, trail_index)
      ((frame_index + line_index + trail_index) % 2).zero? ? '-' : '_'
    end
  end
end
