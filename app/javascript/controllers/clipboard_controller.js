import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="clipboard"
export default class extends Controller {
  static targets = [ "source", "button" ]
  
  copy() {
    this.sourceTarget.select()
    document.execCommand("copy")
    
    this.buttonTarget.textContent = "Copied!"
    setTimeout(() => {
      this.buttonTarget.textContent = "Copy Embed Code"
    }, 2000)
  }
  connect() {
  }
}
