import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ['navbar', 'banner']

  connect() {
    if (this.hasBannerTarget) {
      this.navbarTarget.classList.remove("navbar-lewagon-black")
      this.navbarTarget.classList.add("fixed-top")
    }
  }

  updateNavbar() {
    if (this.hasBannerTarget) {
      if (window.scrollY >= window.innerHeight) {
        this.navbarTarget.classList.add("navbar-lewagon-black")
      } else {
        this.navbarTarget.classList.remove("navbar-lewagon-black")
      }
    }

  }
}
