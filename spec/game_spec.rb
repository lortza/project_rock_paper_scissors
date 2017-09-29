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

  describe '#play_one_player' do
    it 'initiates a 1-player game??'
  end #play_one_player

  describe '#play_two_player' do
    it 'initiates a 2-player game??'
  end #play_two_player

  describe '#computer_makes_choice' do
    it 'returns a randomly selected weapon'
  end

  describe '#announce_round' do
    it 'increments and returns the round number'
  end

  describe '#request_player_choice' do
    it 'calls methods that are already tested'
  end

  describe '#determine_round_winner' do
    context 'when players 1 & 2 have the same weapon' do
      it "the round is a 'tie'"
    end
    context "when player 1 is 'r' and player 2 is 'p" do
      it 'player 2 wins'
    end
    context "when player 1 is 'p' and player 2 is 's" do
      it 'player 2 wins'
    end
    context "when player 1 is 's' and player 2 is 'r" do
      it 'player 2 wins'
    end
    it 'i think this spec can get really redundant...'
  end

  describe '#announce_round_winner' do
  end

  describe '#determine_game_winner' do
    context "when player 1 and player 2 have the same score" do
      it 'the game is a tie'
    end
    context "when player 1's score is higher than player 2's score" do
      it 'player 1 wins the game'
    end
    context "when player 1's score is lower than player 2's score" do
      it 'player 2 wins the game'
    end
  end

  describe '#award_points' do
    context 'when the round is a tie' do
      it 'awards points to neither player'
    end
    context 'when player 1 wins the round' do
      it "one point is added to player 1's score"
    end
    context 'when player 2 wins the round' do
      it "one point is added to player 2's score"
    end
  end

  describe '#announce_game_winner' do
  end

  describe '#play' do
    it 'initiates game play...???'
  end

end #Game
