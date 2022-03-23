require 'rails_helper'

describe User do
  describe :new do
    it 'returns a valid user even without arguments' do
      user = User.new
      expect(user).not_to be_authenticated
      expect(user).not_to be_galc_admin
      expect(user.display_name).to be_nil
      expect(user.email).to be_nil
    end
  end

  describe :from_omniauth do
    let(:auth_hash_admin) do
      {
        'extra' => {
          'uid' => '5551215',
          'displayName' => 'Rachel Roe',
          'berkeleyEduOfficialEmail' => 'rroe@berkeley.test',
          'berkeleyEduIsMemberOf' => [
            'cn=edu:berkeley:org:libr:galc:LIBR-galc-admins,ou=campus groups,dc=berkeley,dc=edu'
          ]
        }
      }
    end

    let(:auth_hash_patron) do
      {
        'extra' => {
          'uid' => '5551212',
          'displayName' => 'Jane Doe',
          'berkeleyEduOfficialEmail' => 'jdoe@berkeley.test',
          'berkeleyEduIsMemberOf' => [
            'cn=edu:berkeley:official:all,ou=campus groups,dc=berkeley,dc=edu'
          ]
        }
      }
    end

    it 'returns a valid user from an auth hash' do
      user = User.from_omniauth(auth_hash_admin)
      expect(user).to be_authenticated
      expect(user).to be_galc_admin
      expect(user.uid).to eq('5551215')
      expect(user.display_name).to eq('Rachel Roe')
      expect(user.email).to eq('rroe@berkeley.test')
    end

    it 'determines admin status based on CalGroups' do
      user = User.from_omniauth(auth_hash_patron)
      expect(user).to be_authenticated
      expect(user).not_to be_galc_admin
      expect(user.uid).to eq('5551212')
      expect(user.display_name).to eq('Jane Doe')
      expect(user.email).to eq('jdoe@berkeley.test')
    end
  end

  describe :from_session do
    it 'reads a user from the session' do
      session_hash = {
        'uid' => '5551213',
        'display_name' => 'Natalie Noe',
        'email' => 'nnoe@berkeley.test',
        'galc_admin' => true
      }

      session = instance_double(ActionDispatch::Request::Session)
      allow(session).to receive(:[]).with(User::SESSION_KEY).and_return(session_hash)

      user = User.from_session(session)
      session_hash.each do |attr, v_expected|
        v_actual = user.send(attr)
        expect(v_actual).to eq(v_expected), "Wrong value for #{attr}; expected #{v_expected.inspect}, was #{v_actual.inspect}"
      end
    end
  end
end
