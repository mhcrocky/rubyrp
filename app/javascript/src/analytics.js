window.dataLayer = window.dataLayer || [];
function gtag(){dataLayer.push(arguments);}
gtag('js', new Date());

document.addEventListener('turbolinks:load', function(event) {
  gtag('config', 'G-V69XBLGQ6S', {
    page_location: event.data.url,
    page_path: event.srcElement.location.pathname,
    page_title: event.srcElement.title
  });
})

export default gtag
