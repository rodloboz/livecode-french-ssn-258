require 'rspec'
require_relative '../french_ssn'


describe "#french_ssn_info" do
  describe "when passed '1 84 12 76 451 089 46'" do
    it "returns 'a man, born in December, 1984 in Seine-Maritime.'" do
      actual = french_ssn_info('1 84 12 76 451 089 46')
      expected = 'a man, born in December, 1984 in Seine-Maritime.'

      expect(actual).to eq(expected)
    end
  end

  describe "when '1 84 12 66 451 089 46'" do
    it "return 'The number is invalid'" do
      actual = french_ssn_info('1 84 12 66 451 089 46')
      expected = 'The number is invalid'

      expect(actual).to eq(expected)
    end
  end

  describe "when passed an empty string" do
    it "return 'The number is invalid'" do
      actual = french_ssn_info('')
      expected = 'The number is invalid'

      expect(actual).to eq(expected)
    end
  end
end

describe "#valid_key?" do
  describe "when passed '1 84 12 76 451 089 46' and '46'" do
    it 'returns true' do
      actual = valid_key?('1 84 12 76 451 089 46', '46')

      expect(actual).to be true
    end
  end

  describe "when passed '1 94 12 76 451 089 46' and '46'" do
    it 'returns false' do
      actual = valid_key?('1 94 12 76 451 089 46', '46')

      # expect(actual).not_to be true
      expect(actual).to be false
    end
  end
end

describe "#gender" do
  describe "when passed '1'" do
    it "returns 'man'" do
      actual = gender('1')
      expected = 'man'

      expect(actual).to eq(expected)
    end
  end
  describe "when passed '2'" do
    it "returns 'woman'" do
      actual = gender('2')
      expected = 'woman'

      expect(actual).to eq(expected)
    end
  end
end

describe "#year" do
  describe "when passed '84'" do
    it "returns '1984'" do
      actual = year('84')
      expected = '1984'

      expect(actual).to eq(expected)
    end
  end
end

describe "#month" do
  describe "when passed '01'" do
    it "returns 'January'" do
      actual = month('01')
      expected = 'January'

      expect(actual).to eq(expected)
    end
  end
end

describe "#department" do
  describe "when passed '76'" do
    it "returns 'Seine-Maritime'" do
      actual = department('76')
      expected = 'Seine-Maritime'

      expect(actual).to eq(expected)
    end
  end
end

