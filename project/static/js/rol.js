var currentRole = '{{ current_role }}';
var roleLabels = '{{ role_labels }}';
var navItems = document.querySelectorAll('.nav-item');
for (var i = 0; i < navItems.length; i++) {
  var navItem = navItems[i];
  var navLink = navItem.querySelector('.nav-link');
  var allowedRoles = navLink.dataset.role.split(',');
  if (allowedRoles.includes(currentRole) && allowedRoles.every(role => roleLabels.includes(role))) {
    navItem.style.display = 'block';
  } else {
    navItem.style.display = 'none';
  }
}


// var currentRole = '{{ current_role }}';
// var roleLabels = '{{ role_labels }}';
// var navItems = document.querySelectorAll('.nav-item');
// for (var i = 0; i < navItems.length; i++) {
//   var navItem = navItems[i];
//   var navLink = navItem.querySelector('.nav-link');
//   var allowedRoles = navLink.dataset.role.split(',');
//   if (allowedRoles.includes(currentRole) && allowedRoles.some(role => roleLabels.includes(role))) {
//     navItem.style.display = 'block';
//   } else {
//     navItem.style.display = 'none';
//   }
// }
