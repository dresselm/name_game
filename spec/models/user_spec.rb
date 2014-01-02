require 'spec_helper'

describe User do

  let(:email_address) { 'email@example.com' }
  let(:last_name)     { 'LastName' }

  it { should have_and_belong_to_many(:names) }
  it { should have_and_belong_to_many(:match_results) }
  it { should have_many(:standings) }

  it { should validate_presence_of(:email_address) }
  it { should validate_presence_of(:last_name) }

  it 'should automatically generate a url token' do
    user = User.create(email_address: email_address, last_name: last_name)
    user.url_token.should_not be_blank
  end

  it 'should create a new User' do
    expect {
      User.create(email_address: email_address, last_name: last_name)
    }.to change(User,:count).by(1)
  end
end
