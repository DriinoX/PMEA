import consumer from "./consumer"

const initRoomCable = () => {
  const participations = document.getElementById('participations');
  if (participations) {
    const id = participations.dataset.room;

    consumer.subscriptions.create({ channel: "RoomChannel", id: id }, {
      received(data) {
        participations.insertAdjacentHTML('beforeend', data); // called when data is broadcast in the cable
      },
    });
  }
}

export { initRoomCable };
