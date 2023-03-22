require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to be_mongoid_document }
  it { is_expected.to have_timestamps }
  it { is_expected.to have_field(:email).of_type(String) }
  it { is_expected.to have_field(:encrypted_password).of_type(String) }
  it { is_expected.to have_field(:reset_password_token).of_type(String) }
  it { is_expected.to have_field(:reset_password_sent_at).of_type(Time) }
  it { is_expected.to have_field(:remember_created_at).of_type(Time) }
  it { is_expected.to have_many :owned_tasks }
  it { is_expected.to have_many :participations }

  describe '#save' do
    context 'with params from scratch' do

      subject(:user) do
        described_class.new(
          email: 'estebanlopez_99@hotmail.com',
          password: '123456'
        )
      end

      it { is_expected.to be_valid }
      context 'after save' do
        before(:each) { user.save }

        it { is_expected.to be_persisted }
      end
    end
  end
end
