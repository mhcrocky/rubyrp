import React from 'react'
import ReactDOM from 'react-dom'
// https://www.npmjs.com/package/react-cookienotice
import CookieNotice from 'react-cookienotice'
import 'react-cookienotice/dist/index.css'

class Cookie extends React.Component {
  constructor(props) {
    super(props)
    this.cookieTextLabel    = "By using our website and services, you agree to our use of cookies as described in our Cookie Policy."
    this.readMoreButtonLink = "https://rails-react-bootstrap.herokuapp.com/pages/cookie_policy"
  }

  render() {
    return (
      <CookieNotice
        cookieTextLabel={this.cookieTextLabel}
        readMoreButtonLink={this.readMoreButtonLink}
      />
    )
  }
}

export default Cookie

document.addEventListener('turbo:load', () => {
  const app = document.getElementById('cookie-banner')
  app && ReactDOM.render(<Cookie />, app)
})

// <div id="cookie-banner" class="mb-5"></div>
