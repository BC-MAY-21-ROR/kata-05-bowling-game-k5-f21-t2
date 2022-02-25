require 'rspec'
require_relative './app/bowls.rb'

describe Frame do

   before(:each) do
    @frame = Frame.new
  end

    it 'A new instance of frame should start with an array of 0 on the score' do
        expect(@frame.score).to eq([0,0])
    end
    it 'A new instance of frame should start with a 0 on the condition' do
        expect(@frame.condition).to eq(0)
    end
    it 'A new instance of frame should start with a 0 on the frame score' do
        expect(@frame.frame_score).to eq(0)
    end
    describe '.throw' do
        it 'Throw should return the number of pins that you threw' do
            expect(@frame.throw(2)).to eq(2)
        end
    end
    describe '.count_score' do
        it 'Should count the score based on the number of pins that you threw ' do
            test=@frame
            test.count_score(5)
            expect(test.score).to eq([5, 5])
        end
    end
end