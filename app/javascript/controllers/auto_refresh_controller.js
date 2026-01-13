import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { 
    refreshInterval: { type: Number, default: 30000 } // 30 seconds
  }

  connect() {
    this.startRefreshing()
  }

  disconnect() {
    this.stopRefreshing()
  }

  startRefreshing() {
    this.refreshTimer = setInterval(() => {
      this.refresh()
    }, this.refreshIntervalValue)
  }

  stopRefreshing() {
    if (this.refreshTimer) {
      clearInterval(this.refreshTimer)
    }
  }

  refresh() {
    // Only refresh if the page is visible
    if (!document.hidden) {
      Turbo.visit(window.location.href, { action: 'replace' })
    }
  }
}