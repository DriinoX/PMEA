import consumer from "./consumer"

const initRaceCable = () => {
  const users = document.getElementById('users');
  if (users) {
    const id = users.dataset.race;

    consumer.subscriptions.create({ channel: "RaceChannel", id: id }, {
      received(data) {
        users.insertAdjacentHTML('beforeend', data); // called when data is broadcast in the cable
      },
    });
  }
}

export { initRaceCable };
