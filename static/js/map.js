$(document).ready(function() {
   var map = L.map('map').setView([-16.49831, -68.1451], 6);
   L.tileLayer('http://{s}.tile.cloudmade.com/{APIKEY}/997/256/{z}/{x}/{y}.png', {
      APIKEY: '5a27ed92198543449be5cb9a79e7e829',
      attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>',
      maxZoom: 18
   }).addTo(map);


   var marker = L.marker([-16.49831, -68.1451]).addTo(map);
   marker.bindPopup('<div id="popup1">Este div tiene id = popup1.</div>');

   $.ajax({
      type: 'GET',
      url: '/miniInfo/123',
      success:function(data){
         console.log(data);
         marker.bindPopup(data);
      },
      error:function(){
         console.log('Error');
      }
   });
});
