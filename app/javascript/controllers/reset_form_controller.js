import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    reset(event) {
        // Only reset if the submission was successful (status 2xx)
        if (event.detail.success) {
            this.element.reset();
        }
    }
}