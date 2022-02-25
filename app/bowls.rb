# frozen_string_literal: true

# Class frame create a new frame for the game
class Frame
  attr_reader :score, :condition, :frame_score

  def initialize
    @pins = 10
    @score = [0, 0]
    @frame_score = 0
    @condition = 0 # 1 = spare 2 = strike
  end

  def throw(ball= rand(0..@pins))
    ball# Lo aprendi de brocha xd
    # 10
  end

  def count_score(threw=throw)
    2.times do |ball|
      next if @condition == 2

      @score[ball] += threw
      @pins -= threw
      @frame_score += threw
      all_pins_out(ball) if @pins.zero?
      threw = throw
    end
  end

  def all_pins_out(ball)
    @condition = ball.zero? ? 2 : 1
  end

  def bonus(extra_score)
    @frame_score += extra_score[0] unless @condition.zero?
    @frame_score += extra_score[1] if @condition == 2
  end

  # Logica de la ultima ronda
  def third_ball
    if @score[1].zero?
      @score[1] = throw
      @frame_score += @score[1]
    end
    @score << throw
    @frame_score += @score[2]
  end
end

# This class store the logic of the game
class Bowling
  attr_reader :points

  def initialize
    @frames = Array.new(10) { Frame.new }
    start_game
    print
  end

  def start_game
    @frames.each_with_index do |frame, index|
      frame.count_score
      frame.third_ball if index == 9 && frame.condition != 0
      check_bonus(index)
    end
  end

  def check_bonus(frame_index)
    frame = @frames[frame_index]
    previous_frame = @frames[frame_index - 1]
    previous_frame2 = @frames[frame_index - 2]
    previous_frame.bonus(frame.score)
    previous_frame2.bonus([0, frame.score[0]]) if previous_frame.condition == 2 && previous_frame2.condition == 2
  end

  def total_score
    score = 0
    @frames.each { |frame| score += frame.frame_score }
    score
  end

  def print
    score = 0
    @frames.each_with_index do |frame, index|
      score += frame.frame_score
      puts "----------------\nFrame #{index + 1}\n----------------"
      case frame.condition
      when 0
        puts "Throw 1: #{frame.score[0]}\nThrow 2: #{frame.score[1]}"
      when 1
        puts "Throw 1: #{frame.score[0]}\nSPARE!!"
      when 2
        puts 'STRIKE!!'
      end
      puts "Score #{score}"
    end
  end
end

Bowling.new

# Este es el método chido por si la cago :´v
# def print
#   score = 0
#   @frames.each_with_index do |frame, i|
#     score += frame.frame_score
#     puts '----------------'
#     puts "Frame #{i + 1}"
#     puts '----------------'
#     case frame.condition
#     when 0
#       puts "Throw 1: #{frame.score[0]}"
#       puts "Throw 2: #{frame.score[1]}"
#     when 1
#       puts "Throw 1: #{frame.score[0]}"
#       puts 'SPARE!!'
#     when 2
#       puts 'STRIKE!!'
#     end
#     puts "Frame score #{score}"
#   end
#   puts "Total score: #{total_score}"
# end

# spare = 10 + siguiente tiro
# strike = 10 + siguientes 2 tiros
