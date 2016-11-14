require 'spec_helper'

describe AdRoll::HTTPartyWrapper do
  describe 'query_string_normalizer proc' do
    context 'With simple params' do
      let(:params) do
        {
          'singular' => 'a_parameter',
          'array' => %w(param1 param2 param3)
        }
      end

      it 'should normalize simple arrays and singular params' do
        expect(described_class.normalizer_proc.call(params)).to eq(
          'singular=a_parameter&array=param1,param2,param3'
        )
      end
    end

    context 'With spacing and arrays' do
      let(:params) do
        {
          'singular' => 'a parameter',
          'array' => ['param 1', 'param 2', 'param 3']
        }
      end

      it 'should normalize simple arrays and singular params' do
        expect(described_class.normalizer_proc.call(params)).to eq(
          'singular=a%20parameter&array=param%201,param%202,param%203'
        )
      end
    end
  end
end
