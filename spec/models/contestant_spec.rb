require 'spec_helper'

describe Contestant do

  it { should validate_presence_of(:first_name)  }
  it { should validate_presence_of(:middle_name) }

  describe '#full_name' do
    let(:first_name)  { 'Clara' }
    let(:middle_name) { 'Bell' }
    it 'should append the middle name to the first name' do
      f_name     = FactoryGirl.create(:name, :name => first_name)
      m_name     = FactoryGirl.create(:name, :name => middle_name)
      contestant = Contestant.create(first_name: f_name, middle_name: m_name)

      expect(contestant.full_name).to eq('Clara Bell')
    end
  end
end
