import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "button", "count" ]
  static values = { 
    postId: Number,
    liked: Boolean,
    count: Number
  }

  connect() {
    this.updateUI()
  }

  toggle(event) {
    event.preventDefault()
    
    this.likedValue = !this.likedValue
    this.countValue = this.likedValue ? this.countValue + 1 : this.countValue - 1
    
    this.updateUI()
    
    // Simulate API call
    this.sendLikeRequest()
  }

  updateUI() {
    if (this.likedValue) {
      this.buttonTarget.classList.add('text-red-500')
      this.buttonTarget.classList.remove('text-gray-500')
      this.buttonTarget.querySelector('svg').classList.add('fill-current')
    } else {
      this.buttonTarget.classList.remove('text-red-500')
      this.buttonTarget.classList.add('text-gray-500')
      this.buttonTarget.querySelector('svg').classList.remove('fill-current')
    }
    
    if (this.countTarget) {
      this.countTarget.textContent = this.countValue
    }
  }

  sendLikeRequest() {
    // In a real app, this would make an API call
    // For now, we'll just simulate it
    console.log(`Post ${this.postIdValue} ${this.likedValue ? 'liked' : 'unliked'}`)
  }
}