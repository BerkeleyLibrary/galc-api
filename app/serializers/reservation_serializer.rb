class ReservationSerializer
  include JSONAPI::Serializer

  has_one :item
  has_one :user

  set_id do |rsvn|
    [rsvn.user_id, rsvn.item_id].join('/')
  end
end
