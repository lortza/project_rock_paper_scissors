require 'game'


describe Game do

  let(:game){Game.new}

  describe '#initialize' do
    it 'gives you a new Game' do
      expect(game).to be_a(Game)
    end

    it 'sets both player scores to 0' do
      expect(game.player1_score).to eq(0)
      expect(game.player2_score).to eq(0)
    end

    it 'sets the round number to 1' do
      expect(game.round_number).to eq(1)
    end

    context 'has empty placeholders for' do
      it 'a round winner' do
        expect(game.round_winner).to eq('')
      end

      it 'a game winner' do
        expect(game.game_winner).to eq('')
        # expect(game.instance_variable_get(:@round_winner)).to eq('')
      end
    end
  end #initialize



end #Game
