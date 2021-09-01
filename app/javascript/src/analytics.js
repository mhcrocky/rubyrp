window.dataLayer = window.dataLayer || [];
function gtag(){dataLayer.push(arguments);}
gtag('js', new Date());

document.addEventListener('turbo:load', function(event) {
  // console.log(event);
  // console.log(event.detail.url);
  // console.log(event.path);
  // console.log(event.srcElement.title);
  gtag('config', 'G-V69XBLGQ6S', {
    page_location: event.detail.url,
    page_path: event.path,
    page_title: event.srcElement.title
  });
})

export default gtag
