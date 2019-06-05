require 'user'

describe User do
  describe '#authenticate' do
    it 'returns user if email is resigtered and the password is correct' do
      user = User.create(email: 'test@test.com', password: '123')

      expect(User.authenticate(email: 'test@test.com', password: '123')) \
        .to eq(user)
    end

    it 'returns nil if email is not resigtered' do
      expect(User.authenticate(email: 'test@test.com', password: '123')) \
        .to eq(nil)
    end
  end
end
