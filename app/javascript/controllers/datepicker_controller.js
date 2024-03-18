import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

export default class extends Controller {
  static values = {
    time: {
      type: Boolean,
      default: false
    }
  }


  connect() {
    if (this.timeValue) {
      flatpickr(this.element, {
        enableTime: true,
        noCalendar: true,
        dateFormat: "H:i",
        time_24hr: true
      })
    } else {
      flatpickr(this.element)
    }
  }
}
