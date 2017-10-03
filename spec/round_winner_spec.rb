require 'winner'

describe RoundWinner do
  describe '#call' do
    let(:weapons) {}
    let(:round_winner) { RoundWinner.new(weapons) }

    subject { round_winner.call(player1_weapon, player2_weapon) }

    describe 'when the weapons are equal' do
      let(:player1_weapon) { 'a' }
      let(:player2_weapon) { 'a' }

      it { is_expected.to eq('tie') }
    end

    describe 'when player 1s weapon is greater' do
      let(:weapons) {
        {
          ['a', '1'] => 'player2'
        }
      }

      let(:player1_weapon) { 'b' }
      let(:player2_weapon) { '1' }

      it { is_expected.to eq('player1') }
    end

    describe 'when player 2s weapon is greater' do
      let(:weapons) {
        {
          ['a', '1'] => 'player2'
        }
      }
      let(:player1_weapon) { 'a' }
      let(:player2_weapon) { '1' }

      it('returns player2') { expect(subject).to eq('player2') }
    end
  end
end