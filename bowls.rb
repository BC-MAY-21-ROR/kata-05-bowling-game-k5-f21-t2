# frozen_string_literal: true

class Frame
  attr_accessor :score, :pins

  def initialize
    @pins = 10
		@score = [0, 0]
		@frame_score = 0
		@condition = 0 #1 = spare 2 = strike
  end
end

class Bowling
  attr_reader :points

  def initialize(pins = 10)
    @tiro = 0
    @points = 0
    @frame = 0
    @pins = pins
    @spare = false
    @strike = false
  end

  def throw
    rand(@pins + 1)
  end

  def new_frame
    @pins = 10
    @tiro = 0
    @frame += 1
    puts "Frame #{@frame}"
    2.times { count_score }
    puts "Tus puntos fueron #{@points}" unless @spare
		 if @frame >= 3 

			else
				new_frame
			end
    
  end

  def count_score(thr = throw)
    tiro = thr
    @tiro += 1
    if @spare == true && @tiro == 1
      @points += tiro
			puts "Tus puntos fueron #{@points}"   
      @spare = false
    end
		puts "Tiraste #{tiro}"
    @points += tiro
    @pins -= tiro
    if @pins.zero? && @tiro == 2
      puts 'Spare'
      @spare = true
    elsif @pins.zero? && @tiro == 1
      puts 'Strike'
      @strike = true
			@tiro = 2
    end
  end

  def print
    @frames.each_with_index do |frame, i|
			puts "Frame #{i + 1}"
			puts "Tiraste #{frame.score[0]}"
			puts "Tiraste #{frame.score[1]}"
			puts "Puntuacion #{frame.frame_score}"
		end 
  end
end



# spare = 10 + siguiente tiro
# strike = 10 + siguientes 2 tiros
juego = Bowling.new
juego.new_frame