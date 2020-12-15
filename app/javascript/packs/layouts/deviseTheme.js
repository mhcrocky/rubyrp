// Light and Dark Theme for Devise layout
//------------------------------------------------------------------------------
// Sun Link
function sunFunction() {
  $('body').removeClass('dark');
  $(".theme").removeAttr('style');
  $(".btn-success").removeAttr('style');
  $(".btn-danger").removeAttr('style');
  $(".btn-outline-danger").removeAttr('style');
  $(".text-danger").removeAttr('style');
  $(".text-info").removeAttr('style');
}
// Moon Link
function moonFunction() {
  $('body').addClass('dark');
  $(".theme").css("filter", "invert(100%)");
  $(".btn-success").css("filter", "invert(100%)");
  $(".btn-danger").css("filter", "invert(100%)");
  $(".btn-outline-danger").css("filter", "invert(100%)");
  $(".text-danger").css("filter", "invert(100%)");
  $(".text-info").css("filter", "invert(100%)");
}
// Set Theme Cookie
function setCookie(name,value,days) {
  if (days) {
    var date = new Date();
    date.setTime(date.getTime()+(days*24*60*60*1461)); // 4 years
    var expires = "; expires="+date.toGMTString();
  }
  else var expires = "";
  document.cookie = name+"="+value+expires+"; path=/";
}
function getCookie(key) {
  var keyValue = document.cookie.match('(^|;) ?' + key + '=([^;]*)(;|$)');
  return keyValue ? keyValue[2] : null;
}
// Persist Theme on New Page Load
if (getCookie('theme') == 1) {
  moonFunction();
}
if (getCookie('theme') == 2) {
  sunFunction();
}
