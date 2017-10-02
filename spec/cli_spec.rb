require 'cli'

describe CLI do
  include CLI

  describe '#ensure_valid_response' do
    let(:acceptable_responses) {["1", "2", "4"]}

    before do
      allow_any_instance_of(CLI).to receive(:get_response) { response }
    end

    context 'when response is an acceptable response' do
      let(:response) { acceptable_responses.sample }

      it "returns a valid response" do
        expect(ensure_valid_response(acceptable_responses)).to eq(response)
      end
    end

    context 'when response is an exit response' do
      let(:response) { CLI::EXIT_COMMANDS.sample }

      before do
        allow_any_instance_of(IO).to receive(:puts)
      end

      it "exits game" do
        expect{ ensure_valid_response(acceptable_responses) }.to raise_error(SystemExit)
      end
    end

    context 'when response is not an acceptable response' do
      let(:response) { 'bad response' }
      let(:valid_response) { acceptable_responses.sample }

      before do
        allow_any_instance_of(IO).to receive(:puts) # suppresses console output
        allow_any_instance_of(CLI).to receive(:get_response).and_return(response, valid_response) # sets the value of CLI's get_response to an array of things called once each time through the loop
      end

      it 'asks for an acceptable response until it gets one' do
        # the first time through uses the bad response and fails.
        # the recursion runs again, using the second argument in
        # the and_return from above. this new response passes,
        # and exits the loop
        expect(ensure_valid_response(acceptable_responses)).to eq(valid_response)
      end
    end

  end

  describe 'stringify_response_options' do
    it 'outputs the weapon options like a sentence' do
      lib = {'a' => 'A', 'b'=> 'B', 'c'=> 'C'}
      expect(stringify_response_options(lib)).to eq("a, b, or c")
    end
  end

  describe 'response_options' do
    it 'returns the single letter options for all responses' do
      lib = {'a' => 'A', 'b'=> 'B', 'c'=> 'C'}
      expect(response_options(lib)).to eq(['a', 'b', 'c'])
    end
  end

end