# frozen_string_literal: true

# Main class where you can find all the logic for the game
class Game
  def initialize
    @roll = -1
    @rolls = Array.new(21, 0)
  end

  def roll(pins_down)
    @rolls[@roll += 1] = pins_down

    pins_down == 10 ? @rolls[@roll += 1] = 10 : return
  end

  def strike_sum(cursor)
    10 + pointer(cursor, 2) + pointer(cursor, 3)
  end

  def strike(score, cursor, counter)
    score += strike_sum(cursor)

    if last?(counter)
      puts "10 x #{pointer(cursor, 2)} #{pointer(cursor, 3)} \n #{score}"
    else
      puts "10 x \n #{score}"
    end
    score
  end

  def spare_sum(cursor)
    10 + pointer(cursor, 2)
  end

  def spare(score, cursor, counter)
    score += spare_sum(cursor)
    print "#{pointer(cursor)} / "
    puts "#{pointer(cursor, 2)} " if last?(counter)
    puts "\n #{score}"
    score
  end

  def pointer(cursor, times = 0)
    @rolls[cursor + times]
  end

  def score
    score = 0
    cursor = 0
    10.times do |counter|
      if pointer(cursor) == 10
        score = strike(score, cursor, counter)
      elsif spare?(cursor)

        score = spare(score, cursor, counter)

      else

        score += pointer(cursor) + pointer(cursor, 1)
        puts "#{pointer(cursor)} #{pointer(cursor, 1)} \n #{score}"

      end
      cursor += 2
    end
    score
  end

  def spare?(cursor)
    pointer(cursor) + pointer(cursor, 1) == 10
  end

  def last?(counter)
    counter == 9
  end
end
