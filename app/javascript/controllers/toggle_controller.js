import { Controller } from "@hotwired/stimulus"

// Toggle/Hide at least one item (multiple triggers and items are supported) through a CSS class
// All items will be toggled by any of the triggers (if there are multiple triggers)
// "aria-expanded" is also toggled on the triggers.
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

  toggle() {
    this.triggerTargets.forEach(trigger => {
      trigger.setAttribute("aria-expanded", !(trigger.getAttribute("aria-expanded") === "true"))
    })

    this.itemTargets.forEach(item => {
      item.classList.toggle(this.class)
    })
  }

  hide(event) {
    // Prevent hiding the items right after they have been shown when the event is coming from a trigger or an item
    // This code is needed when handling clicks on the window
    if (event && (this._a_trigger_was_event_target() || this._an_item_was_event_target())) {
      return
    }

    this.triggerTargets.forEach(trigger => {
      trigger.setAttribute("aria-expanded", "false")
    })

    this.itemTargets.forEach(item => {
      item.classList.add(this.class)
    })
  }

  _a_trigger_was_event_target() {
    return this.triggerTargets.some(trigger => trigger.contains(event.target))
  }

  _an_item_was_event_target() {
    return this.itemTargets.some(item => item.contains(event.target))
  }
}
