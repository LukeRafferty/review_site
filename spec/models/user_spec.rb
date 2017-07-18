require 'rails_helper'

RSpec.describe User, type: :model do

  it { should have_valid(:username).when('username') }
  it { should_not have_valid(:username).when(nil) }

  it { should have_valid(:email).when('user@example.com') }
  it { should_not have_valid(:username).when(nil, 'user.com', 'user') }

end
