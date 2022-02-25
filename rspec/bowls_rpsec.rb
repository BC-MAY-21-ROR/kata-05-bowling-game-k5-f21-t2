require 'rspec'
require_relative '../app/bowls.rb'

describe Game do
    before(:each) do
        @game=Game.new
    end
    describe '.score' do
        it 'Can score gutter game' do
            roll(20,0)
            expect(@game.score).to eq(0)
        end
        it 'Can roll game of ones' do
            roll(20,1)
            expect(@game.score).to eq(20)
        end
        it 'Can score spare followed by a 3' do
            rall([5,5, 3,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0])
            expect(@game.score).to eq(16)
        end
        it 'Can score strike followed 2 3' do
            rall([10, 3,3, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0])
            expect(@game.score).to eq(22)
        end
        it 'Can score all strikes' do
           roll(12,10)
            expect(@game.score).to eq(300)
        end
        it 'Can score all spares of 5' do
            rall([5,5, 5,5, 5,5, 5,5, 5,5, 5,5, 5,5, 5,5, 5,5, 5,5, 5,5, 5,5, 5])
            expect(@game.score).to eq(150)
        end
    end
    
    
end
def rall(rolls)
    rolls.each_index do |i|
      @game.roll(rolls[i])
    end
  end

  
  def roll(many,balls)
    many.times do
        @game.roll(balls)
    end
  end