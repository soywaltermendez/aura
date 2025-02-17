import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu"]

  connect() {
    // Cerrar el menú cuando se hace clic fuera
    document.addEventListener('click', this.closeMenu.bind(this))
  }

  disconnect() {
    document.removeEventListener('click', this.closeMenu.bind(this))
  }

  toggle(event) {
    event.stopPropagation()
    this.menuTarget.classList.toggle('hidden')
  }

  closeMenu(event) {
    if (!this.element.contains(event.target)) {
      this.menuTarget.classList.add('hidden')
    }
  }
} 