require 'spec_helper'

describe MatchResult do
  it { should have_and_belong_to_many(:users) }
end
