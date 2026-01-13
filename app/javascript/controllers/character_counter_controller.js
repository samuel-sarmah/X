import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "input", "counter" ]
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
    const submitButton = this.element.querySelector('input[type="submit"]')
    if (submitButton) {
      submitButton.disabled = remaining < 0
      if (remaining < 0) {
        submitButton.className = 'px-6 py-2 bg-gray-300 text-gray-500 font-semibold rounded-full text-center cursor-not-allowed inline-block'
      } else {
        submitButton.className = 'px-6 py-2 bg-sky-400 text-white font-semibold rounded-full text-center cursor-pointer inline-block hover:bg-sky-500 transition ease-in-out duration-300'
      }
    }
  }
}