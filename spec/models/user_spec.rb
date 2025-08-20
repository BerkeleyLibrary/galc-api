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
          'berkeleyEduAlternateID' => 'rroe-alt@berkeley.test',
          'berkeleyEduIsMemberOf' => [
            'cn=edu:berkeley:org:libr:galc:galc-admins,ou=campus groups,dc=berkeley,dc=edu'
          ]
        }
      }
    end

    let(:auth_hash_patron) do
      {
        'extra' => {
          'uid' => '5551212',
          'displayName' => 'Jane Doe',
          'berkeleyEduAlternateID' => 'jdoe-alt@berkeley.test',
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
      expect(user.email).to eq('rroe-alt@berkeley.test')
    end

    it 'determines admin status based on CalGroups' do
      user = User.from_omniauth(auth_hash_patron)
      expect(user).to be_authenticated
      expect(user).not_to be_galc_admin
      expect(user.uid).to eq('5551212')
      expect(user.display_name).to eq('Jane Doe')
      expect(user.email).to eq('jdoe-alt@berkeley.test')
    end
  end

end
