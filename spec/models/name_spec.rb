require 'spec_helper'

describe Name do

  let(:user) { FactoryGirl.create(:user) }

  it { should have_and_belong_to_many(:users) }

  it 'should create a new Name' do
    expect {
      Name.create(name: 'TestName', is_first_name: true, is_middle_name: true)
    }.to change(Name,:count).by(1)
  end
end
