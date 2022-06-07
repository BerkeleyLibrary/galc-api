require 'rails_helper'

describe Reservation do
  let(:user) do
    xml_h = Hash.from_xml(File.read('spec/data/cas/5551212.xml'))
    attributes = xml_h['serviceResponse']['authenticationSuccess']['attributes']
    User.from_omniauth({ 'extra' => attributes })
  end

  attr_reader :item

  before do
    @item = create(:item)
  end

  describe :new do
    it 'takes a user and item' do
      rsvn = Reservation.new(user: user, item: item)
      expect(rsvn.user).to eq(user)
      expect(rsvn.item).to eq(item)

      expect(rsvn.item_id).to eq(item.id)
      expect(rsvn.user_id).to eq(user.uid)
    end
  end

  describe :validate do
    context 'with available item' do
      before do
        allow(AvailabilityService).to receive(:available?).with(item).and_return(true)
      end

      it 'requires a user' do
        rsvn = Reservation.new(user: nil, item: item)
        rsvn.validate
        errors = rsvn.errors
        expect(errors).not_to be_empty
        expect(errors.full_messages).to include("User can't be blank")
      end

      it 'requires an authenticated user' do
        user.uid = nil

        rsvn = Reservation.new(user: user, item: item)
        rsvn.validate

        errors = rsvn.errors
        expect(errors).not_to be_empty
        expect(errors.full_messages).to include('User is not authenticated')
      end
    end

    context 'with authenticated user' do
      it 'requires an item' do
        rsvn = Reservation.new(user: user, item: nil)
        rsvn.validate

        errors = rsvn.errors
        expect(errors).not_to be_empty
        expect(errors.full_messages).to include("Item can't be blank")
      end

      it 'requires an available item' do
        allow(AvailabilityService).to receive(:available?).with(item).and_return(false)

        rsvn = Reservation.new(user: user, item: item)
        rsvn.validate

        errors = rsvn.errors
        expect(errors).not_to be_empty
        expect(errors.full_messages).to include('Item is not available')
      end
    end
  end
end
