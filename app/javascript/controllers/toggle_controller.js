import { Controller } from "@hotwired/stimulus"

// Toggle/Show/Hide at least one item (multiple items are supported) through a CSS class
//
// Example with a button which, when clicked, toggles a list with the my_custom_hidden CSS class.
// Clicking anywhere else, beside the list itself, will hide the list.
// <div data-controller="toggle" data-toggle-hidden-class="my_custom_hidden">
//   <button type="button" data-toggle-target="trigger" data-action="click->toggle#toggle click@window->toggle#hide" aria-expanded="false">
//     Button
//   </button>
//   <ul data-toggle-target="item" class="my_custom_hidden">
//     <li>Something</li>
//   </ul>
// </div>
export default class extends Controller {
  static targets = ["trigger", "item"]
  static classes = ["hidden"]

  connect() {
    // The default CSS class will be "hidden" when a custom CSS class isn't provided
    this.class = this.hasHiddenClass ? this.hiddenClass : "hidden"
  }

  toggle(event) {
    console.log("toggle")
    this.triggerTarget.setAttribute("aria-expanded", !(this.triggerTarget.getAttribute("aria-expanded") === "true"))

    this.itemTargets.forEach(item => {
      item.classList.toggle(this.class)
    })
  }

  show() {
    this.triggerTarget.setAttribute("aria-expanded", "true")

    this.itemTargets.forEach(item => {
      item.classList.remove(this.class)
    })
  }

  hide(event) {
    // Prevent hiding the items right after they have been shown when the event is coming from the trigger or an item
    if (event && (this.triggerTarget.contains(event.target) || this._an_item_was_event_target())) {
      return
    }

    this.triggerTarget.setAttribute("aria-expanded", "false")

    this.itemTargets.forEach(item => {
      item.classList.add(this.class)
    })
  }

  _an_item_was_event_target() {
    return this.itemTargets.some(item => item.contains(event.target))
  }
}
