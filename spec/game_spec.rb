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
    let(:acceptable_responses) {["1", "2", "3"]}
    it 'returns a randomly selected weapon' do
      computer_choice = game.send(:computer_makes_choice,acceptable_responses)
      expect(acceptable_responses).to include(computer_choice)
    end
  end

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

  describe '#determine_round_winner' do
    it 'needs to be rewritten with mocks'
    # context 'when players 1 & 2 have the same weapon' do
    #   it "the round is a 'tie'" do
    #     expect(game.send(:determine_round_winner, 1, 1)).to eq('tie')
    #   end
    # end
    # context "when player 1 is 'r' and player 2 is 'p'" do
    #   it 'player 2 wins' do
    #     expect(game.send(:determine_round_winner, 'r', 'p')).to eq('player2')
    #   end
    # end
    # context "when player 1 is 'p' and player 2 is 's'" do
    #   it 'player 2 wins' do
    #     expect(game.send(:determine_round_winner, 'p', 's')).to eq('player2')
    #   end
    # end
    # context "when player 1 is 's' and player 2 is 'r'" do
    #   it 'player 2 wins' do
    #     expect(game.send(:determine_round_winner, 's', 'r')).to eq('player2')
    #   end
    # end
    # context "when player 2 is 'p' and player 2 is 'r'" do
    #   it 'player 1 wins' do
    #     expect(game.send(:determine_round_winner, 'p', 'r')).to eq('player1')
    #   end
    # end
    # context "when player 2 is 's' and player 2 is 'p'" do
    #   it 'player 1 wins' do
    #     expect(game.send(:determine_round_winner, 's', 'p')).to eq('player1')
    #   end
    # end
    # context "when player 2 is 'r' and player 2 is 's'" do
    #   it 'player 1 wins' do
    #     expect(game.send(:determine_round_winner, 'r', 's')).to eq('player1')
    #   end
    # end
  end

  describe '#announce_round_winner' do
    it 'puts the round winner in the console'
  end

  describe '#determine_game_winner' do
    it 'needs to be written with mocks'
    # context "when player 1 and player 2 have the same score" do
    #   it 'the game is a tie' do
    #     game.player1_score = 1
    #     game.player2_score = 1
    #     expect(game.send(:determine_game_winner)).to eq('tie')
    #   end
    # end
    # context "when player 1's score is higher than player 2's score" do
    #   it 'player 1 wins the game' do
    #     game.player1_score = 2
    #     game.player2_score = 1
    #     expect(game.send(:determine_game_winner)).to eq('player1')
    #   end
    # end
    # context "when player 1's score is lower than player 2's score" do
    #   it 'player 2 wins the game' do
    #     game.player1_score = 1
    #     game.player2_score = 2
    #     expect(game.send(:determine_game_winner)).to eq('player2')
    #   end
    # end
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

  describe '#announce_game_winner' do
    before do
      allow_any_instance_of(IO).to receive(:puts)
    end
    context 'when the game is a tie' do
      xit 'announces the game is a tie in the console' do
        expect(game.send(:announce_game_winner, 'Jeff')).to eq('This game is a tie.')
      end
    end

    context 'when player 1 wins' do
      xit 'announces player 1 as the winner in the console' do
        expect(game.send(:announce_game_winner, 'Player 2')).to eq('Player 1 wins the game!')
      end
    end

    context 'when player 2 wins' do
      xit 'announces player 2 as the winner in the console' do
        expect(game.send(:announce_game_winner, 'Player 2')).to eq('Player 2 wins the game!')
      end
    end
  end

  describe '#play' do
    it 'initiates game play...???'
  end

end #Game
