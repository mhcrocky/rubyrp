// Light and Dark Theme for main application layout
//------------------------------------------------------------------------------
// Sun Link
function sunFunction() {
  // links
  $('.page-theme-sun-link').addClass('text-muted');
  $('.page-theme-moon-link').removeClass('text-muted');
  // content
  $("body").removeAttr('style');
  $(".theme").removeAttr('style');
  $(".bg-shnozberry").removeAttr('style');
  $(".bg-tayberry").removeAttr('style');
  $(".bg-success").removeAttr('style');
  $(".bg-danger").removeAttr('style');
  $(".btn-success").removeAttr('style');
  $(".btn-outline-success").removeAttr('style');
  $(".btn-danger").removeAttr('style');
  $(".btn-outline-danger").removeAttr('style');
  $(".text-danger").removeAttr('style');
  $(".card img").removeAttr('style');
  $("code").removeAttr('style');
  $("iframe").removeAttr('style');
}
// Moon Link
function moonFunction() {
  // links
  $('.page-theme-sun-link').removeClass('text-muted');
  $('.page-theme-moon-link').addClass('text-muted');
  // content
  $("body").css("background", "#000");
  $(".theme").css("filter", "invert(100%)");
  $(".bg-shnozberry").css("filter", "invert(100%)");
  $(".bg-tayberry").css("filter", "invert(100%)");
  $(".bg-success").css("filter", "invert(100%)");
  $(".bg-danger").css("filter", "invert(100%)");
  $(".btn-success").css("filter", "invert(100%)");
  $(".btn-outline-success").css("filter", "invert(100%)");
  $(".btn-danger").css("filter", "invert(100%)");
  $(".btn-outline-danger").css("filter", "invert(100%)");
  $(".text-danger").css("filter", "invert(100%)");
  $(".card img").css("filter", "invert(100%)");
  $("code").css("filter", "invert(100%)");
  $("iframe").css("filter", "invert(100%)");
}
// Set Theme Cookie
function setCookie(name,value,days) {
  if (days) {
    var date = new Date();
    date.setTime(date.getTime()+(days*24*60*60*10000));
    var expires = "; expires="+date.toGMTString();
  }
  else var expires = "";
  document.cookie = name+"="+value+expires+"; path=/";
}
function getCookie(key) {
  var keyValue = document.cookie.match('(^|;) ?' + key + '=([^;]*)(;|$)');
  return keyValue ? keyValue[2] : null;
}
// Update Cookie/Theme Without Reload
$('.page-theme-moon-link').on('click', function () {
  setCookie('theme','1', '30');
  // console.log('Dark Theme Cookie (Moon = 1): ' + getCookie('theme'));
  moonFunction();
});
$('.page-theme-sun-link').on('click', function () {
  setCookie('theme','2', '30');
  // console.log('Light Theme Cookie (Sun = 2): ' + getCookie('theme'));
  sunFunction();
});
// Persist Theme on New Page Load
if (getCookie('theme') == 1) {
  // console.log('Dark Theme');
  moonFunction();
}
if (getCookie('theme') == 2) {
  // console.log('Bright Theme');
  sunFunction();
}
