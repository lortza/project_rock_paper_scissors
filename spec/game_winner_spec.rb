require 'game_winner'

describe GameWinner do

  describe '#call' do
    let(:game_winner) { GameWinner.new }

    subject { game_winner.call(player1_score, player2_score) }

    describe 'when the scores are equal' do
      let(:player1_score) { '1' }
      let(:player2_score) { '1' }

      it { is_expected.to eq('tie') }
    end

    describe "when player 1's score is greater than player 2's, the winner" do
      let(:player1_score) { '1' }
      let(:player2_score) { '0' }

      it { is_expected.to eq('player1') }
    end

    describe "when player 2's score is greater than player 1's, the winner" do
      let(:player1_score) { '0' }
      let(:player2_score) { '1' }

      it { is_expected.to eq('player2') }
    end
  end

end