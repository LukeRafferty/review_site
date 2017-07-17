require 'rails_helper'

RSpec.describe User, type: :model do


  let!(:user) { User.create(username: "username", email: "user@gmail.com", encrypted_password: "password", admin: false, sign_in_count: 1) }
  let!(:admin) { User.create(username: "admin", email: "admin@gmail.com", encrypted_password: "Apassword", admin: true, sign_in_count: 10) }

  it "user has all required info" do
    expect(user.username).to eq 'username'
    expect(user.email).to eq 'user@gmail.com'
    expect(user.encrypted_password).to eq 'password'
    expect(user.admin).to eq false
    expect(user.sign_in_count).to eq 1
  end

  it "admin has all required info" do
    expect(admin.username).to eq 'admin'
    expect(admin.email).to eq 'admin@gmail.com'
    expect(admin.encrypted_password).to eq 'Apassword'
    expect(admin.admin).to eq true
    expect(admin.sign_in_count).to eq 10
  end
end
