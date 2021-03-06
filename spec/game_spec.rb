require 'game'
require 'winner'
require 'weapons'


describe Game do
  include Weapons


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
      end
    end
  end #initialize

  describe '#announce_round' do
    before do
      allow_any_instance_of(IO).to receive(:puts)
    end

    it 'increments and returns the round number' do
      game.round_number = 1
      expect(game.send(:announce_round)).to eq(2)
    end
  end

  describe '#request_player_choice' do
    it 'calls methods that are already tested'
  end

  describe '#determine_winner' do
    describe 'for each round' do
      let(:weapons_score) {
        { ['a', '1'] => 'player2' }
      }

      let(:round_winner) { RoundWinner.new(weapons_score) }

      xit 'return the winner of the round' do
        # expect(round_winner).to receive(:call).with('a', 'a')
        # game.send(:determine_winner,'a', '1', 'round')
        allow(round_winner).to receive(:call).with('a', 'a').and_return('tie')
      end
    end

    describe 'for each game' do
      let(:game_winner) { GameWinner.new }

      xit 'return the winner of the game' do
        allow(game_winner).to receive(:call).with(1, 1).and_return('tie')
      end
    end
  end

  describe '#award_points' do
    context 'when the round is a tie' do
      it 'does not awards points to player 1' do
        game.round_winner = 'tie'
        player1_before = game.player1_score
        game.send(:award_points)
        player1_after = game.player1_score
        expect(player1_before).to eq(player1_after)
      end

      it 'does not awards points to player 2' do
        game.round_winner = 'tie'
        player2_before = game.player2_score
        game.send(:award_points)
        player2_after = game.player2_score
        expect(player2_before).to eq(player2_after)
      end
    end

    context 'when player 1 wins the round' do
      it "one point is added to player 1's score" do
        game.round_winner = 'player1'
        game.player1_score = 0
        game.send(:award_points)
        expect(game.player1_score).to eq(1)
      end

      it 'does not awards points to player 2' do
        game.round_winner = 'player1'
        game.player2_score = 0
        game.send(:award_points)
        expect(game.player2_score).to eq(0)
      end
    end

    context 'when player 2 wins the round' do
      it "one point is added to player 2's score" do
        game.round_winner = 'player2'
        game.player2_score = 0
        game.send(:award_points)
        expect(game.player2_score).to eq(1)
      end

      it 'does not awards points to player 1' do
        game.round_winner = 'player2'
        game.player1_score = 0
        game.send(:award_points)
        expect(game.player1_score).to eq(0)
      end
    end
  end

  describe '#display_score' do
    before do
      allow_any_instance_of(IO).to receive(:puts)
    end
    let(:player2_name) { "Player 2" }
    xit 'displays the score' do
      game.send(:display_score, player2_name)
    end
  end

  describe '#play_rounds' do
    it 'initiates a round'
  end

  describe '#play_game' do
    it 'initiates game play...???'
  end

end #Game


describe OnePlayerGame do
  let(:one_player_game){ OnePlayerGame.new }
  let(:rounds) { 3 }

  describe '#play' do
    it 'initiates a one-player game' do
      expect(one_player_game).to receive(:play_game).with(rounds: rounds, player2_name: "The Computer", weapon_selection_proc: Proc.new { 'placeholder' })
      one_player_game.play
    end
  end

  describe '#computer_makes_choice' do
    let(:acceptable_responses) {["1", "2", "3"]}
    it 'returns a randomly selected weapon' do
      computer_choice = one_player_game.send(:computer_makes_choice,acceptable_responses)
      expect(acceptable_responses).to include(computer_choice)
    end
  end
end #OnePlayer

describe TwoPlayerGame do
  let(:two_player_game){ TwoPlayerGame.new }
  let(:rounds) { 3 }

  describe '#play' do
    it 'initiates a two-player game' do
      expect(two_player_game).to receive(:play_game).with(rounds: rounds, player2_name: "Player 2", weapon_selection_proc: Proc.new { 'placeholder' })
      two_player_game.play
    end
  end

end #TwoPlayer
