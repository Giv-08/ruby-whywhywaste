import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="alert"
export default class extends Controller {
  static targets = ["flash"]
  connect() {

    setTimeout(() => {
      this.flashTarget.classList.add("d-none")
    }, 1500);
  }

}
