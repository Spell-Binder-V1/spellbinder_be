require 'rails_helper'

RSpec.describe "decks create" do
  describe "POST deck" do
    context "with valid parameters it creates a deck" do
      scenario "creates a new deck" do
        user = User.create!(username: 'Buff MagicKarp', email: 'level@gang')

        allow_any_instance_of(ApplicationController).to receive(:session).and_return({ user_id: user.id })

        valid_attributes = { name: 'Weak MagicKarp' }

        expect {
          post api_v0_decks_path, params: { deck: valid_attributes }
        }.to change(Deck, :count).by(1)
        expect(response).to have_http_status(201)
      end
    end

    context "not logged in" do
      it "does not create a new deck" do
        invalid_attributes = { name: nil }
        expect {
          post api_v0_decks_path, params: { deck: invalid_attributes }
        }.not_to change(Deck, :count)
        expect(response).to have_http_status(302)
      end
    end

    context 'logged in, but invalid attributes' do
      scenario 'does not create a new deck' do
        user = User.create!(username: 'Buff MagicKarp', email: 'level@gang')

        allow_any_instance_of(ApplicationController).to receive(:session).and_return({ user_id: user.id })

        valid_attributes = { name: '' }
        post api_v0_decks_path, params: { deck: valid_attributes }
        expect(response).to have_http_status(422)
      end
    end
  end
end
