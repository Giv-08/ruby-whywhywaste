import { Controller } from "@hotwired/stimulus"
import { FetchRequest } from '@rails/request.js'

export default class extends Controller {
  static targets = [ "input", "hideme" ]

  connect() {
  }

  toggle() {
    if (this.inputTarget.checked) {
      this.hidemeTarget.style.display = "block";
    } else {
      this.hidemeTarget.style.display = "none";
    }

    this.sendRequest()
  }

  async sendRequest() {
    const request = new FetchRequest(
      'patch',
      this.element.action,
      {
        body: JSON.stringify({ food: { bestseller: this.inputTarget.checked } }),
        headers:  {
          "Content-Type": "application/json",
          "Accept": "application/json"
        },
      })
    const response = await request.perform()
    if (response.ok) {
      const body = await response.json
      console.log("SUccess")
      console.log(body)
      // Do whatever do you want with the response body
      // You also are able to call `response.html` or `response.json`, be aware that if you call `response.json` and the response contentType isn't `application/json` there will be raised an error.
    }
  }
}
