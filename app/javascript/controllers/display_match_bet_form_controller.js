import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="display-match-bet-form"
export default class extends Controller {
  static targets = ['display', 'btn']
  static values = {
    matchId: Number,
    matchBetId: Number
  }

  connect() {
    console.log('HELLLOOOO');
  }

  openForm() {
    fetch(`/matches/${this.matchIdValue}/match_bets/${this.matchBetIdValue}/edit`, { headers: { "Accept": "text/plain" } })
      .then(response => response.text())
      .then((data) => {
        console.log(data);
        this.btnTarget.classList.add('d-none')
        this.displayTarget.innerHTML = data
      })
    console.log(this.matchIdValue);
    console.log(this.matchBetIdValue);
  }

  closeForm(event) {
    event.preventDefault()
    this.displayTarget.innerText = ''
    this.btnTarget.classList.remove('d-none')
  }
}
