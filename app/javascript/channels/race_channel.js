import consumer from "./consumer"

const initRaceCable = () => {
  const bets = document.getElementById('bets');
  if (bets) {
    const id = bets.dataset.race;

    consumer.subscriptions.create({ channel: "RaceChannel", id: id }, {
      received(data) {
        bets.insertAdjacentHTML('beforeend', data); // called when data is broadcast in the cable
      },
    });
  }
}

export { initRaceCable };
