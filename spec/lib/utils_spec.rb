require 'spec_helper'

describe AdRoll::Utils do
  describe '.snakecase' do
    subject(:sc) { described_class.snakecase 'SnakeCase' }
    it { is_expected.to eq 'snake_cae' }

    context 'when it does not recieve a string' do
      it 'should raise an exception' do
        expect do
          described_class.snakecase(:SnakeCase)
        end.to raise_error ArgumentError
      end
    end
  end
end
