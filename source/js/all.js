// require_tree .
//= require bootstrap

$(document).ready(function(){
  $('a[data-toggle=tooltip]').tooltip()
});

// var fb = new Firebase("https://brilliant-fire-1525.firebaseio.com/");


// fb.set({
//   title: "Hello World!",
//   author: "Firebase",
//   location: {
//     city: "San Francisco",
//     state: "California",
//     zip: 94103
//   }
// });

// fb.child("location/city").on("value", function(snapshot) {
//   alert(snapshot.val());  // Alerts "San Francisco"
// });