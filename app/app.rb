# frozen_string_literal: true

require_relative './bowls'
@game = Game.new

def rall(rolls)
  rolls.each_index do |counter|
    @game.roll(rolls[counter])
  end
end

pins = 10
11.times do |_counter|
  ran = rand(0..pins)
  pins -= ran
  @game.roll(ran)
  if ran == 10
    pins = 10
    next
  end
  ran = rand(0..pins)
  @game.roll(ran)
  pins = 10
end

puts 'Scores'
@game.score
