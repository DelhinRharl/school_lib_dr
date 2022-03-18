require './corrector'

describe Corrector do
  context 'testing the corrector class' do
    corrector = Corrector.new

    it 'test string length' do
      name = 'affaxedkiprotich'
      corrected_name = corrector.correct_name(name)
      expect(corrected_name).to eq 'Affaxedkip'
    end

    it 'the method correct_name capitalize the name and trim to 10 length' do
      name = 'affaxedkiprotich'
      corrected_name = corrector.correct_name(name)
      expect(corrected_name).to eq 'Affaxedkip'
    end
  end
end
