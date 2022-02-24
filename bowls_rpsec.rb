require 'rspec'
require_relative 'bowls.rb'

describe 'Bowling' do
    it 'Any new instance of a game should start with 0 points' do
        expect((Bowling.new).points).to eq(0)
    end
    describe '.throw' do
        it 'Should return a random number between 0 and the number of pins aviable on the rail' do
            testGame=Bowling.new(rand(1..9))
            expect(testGame.throw).to be_between(0, 8).inclusive
        end
    end
end