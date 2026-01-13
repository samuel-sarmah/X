import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "input", "counter", "submitButton" ]
  static values = { 
    maxLength: Number,
    warningLength: { type: Number, default: 200 }
  }

  connect() {
    this.updateCounter()
  }

  updateCounter() {
    const currentLength = this.inputTarget.value.length
    const remaining = this.maxLengthValue - currentLength
    
    this.counterTarget.textContent = remaining
    
    // Update visual feedback
    if (remaining <= 0) {
      this.counterTarget.className = 'text-red-500 font-bold'
    } else if (currentLength >= this.warningLengthValue) {
      this.counterTarget.className = 'text-yellow-500 font-bold'
    } else {
      this.counterTarget.className = 'text-gray-500'
    }
    
    // Enable/disable submit button
    if (this.submitButtonTarget) {
      this.submitButtonTarget.disabled = remaining < 0 || currentLength === 0
    }
  }

  expandTextArea() {
    this.inputTarget.rows = 6
  }

  collapseTextArea() {
    if (this.inputTarget.value.length === 0) {
      this.inputTarget.rows = 2
    }
  }
}