import { Controller} from "stimulus"
console.log("reset js controller firing");

export default class extends Controller {
  static targets = ["posted"]

  reset() {
    console.log("Start reset");
    this.element.reset()
    this.buttonTarget.disabled = false
    console.log("End reset");
  }
}

console.log("reset js controller fired");
