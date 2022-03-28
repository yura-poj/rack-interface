require './classes/time_format'
RSpec.describe TimeFormat do
  describe 'output' do
    context 'quiry string with wrong params' do
      it 'return text' do
        formatter1 = TimeFormat.new('format=yr%2Cmh%2Cday')

        expect(formatter1.output).to eq 'Wrong params: yr, mh'
      end
    end

    context 'quiry string with allow params' do
      it 'return text' do
        formatter2 = TimeFormat.new('format=yr%2Cmh%2Cday')

        expect(formatter2.output).not_to be_empty
      end
    end

    context 'quiry string with wrong parameter' do
      it 'return text' do
        formatter2 = TimeFormat.new('fort=yr%2Cmh%2Cday')

        expect(formatter2.output).to be_empty
      end
    end
  end
end
