<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <title>Hospitals</title>
    <style>
    h1
{
font-size:50px;
text-align:center;
color:black;
text-shadow: 3px 3px white;
font-family:"Georgia" ,serif;
}
input[type=text] {
    width: 20%;
    box-sizing: border-box;
    border: 2px solid #ccc;
    border-radius: 4px;
    font-size: 16px;
    background-position:2px 2px;
    background-repeat: no-repeat;
    padding: 12px 20px 12px 10px;
    margin-right:6em;
}
.select{
width: 20%;
box-sizing: border-box;
border: 2px solid #ccc;
border-radius: 4px;
font-size: 16px;
padding: 12px 20px 12px 10px;
margin-right:6em;
}
.submit
{
box-sizing:border-box;
color:#FAFAFA;
background-color:#207CCA;
border-radius:4px;
height:50px;
width:100px;
border:2px solid black;
}
footer
{
margin-top:20em;
font-size:30px;
background-color:black;
text-align:center;
color:white;
}
      
      #map {
        height: 80%;
        width:80%;
	    margin-top:5em;
      }
      
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
        background-color:lightgrey;
      }
      #right-panel {
        font-family: 'Roboto','sans-serif';
        line-height: 30px;
        padding-left: 10px;
      }

      #right-panel select, #right-panel input {
        font-size: 15px;
      }

      #right-panel select {
        width: 100%;
      }

      #right-panel i {
        font-size: 12px;
      }
      #right-panel {
        font-family: Arial, Helvetica, sans-serif;
        position: absolute;
        right: 10px;
        top: 75%;
        margin-top: -155px;
        height: 400px;
        width: 230px;
        padding: 5px;
        z-index: 5;
        border: 1px solid #999;
        background: #fff;
      }
      h2 {
        font-size: 22px;
        margin: 0 0 5px 0;
      }
      .ulclass {
        list-style-type: none;
        padding: 0;
        margin: 0;
        height: 350px;
        width: 230px;
        overflow-y: scroll;
      }
      li {
        background-color: #f1f1f1;
        padding: 10px;
        text-overflow: ellipsis;
        white-space: nowrap;
        overflow: hidden;
      }
      li:nth-child(odd) {
        background-color: #fcfcfc;
      }
      #more {
        width: 100%;
        margin: 5px 0 0 0;
      }
    </style>
    <script>
      // This example requires the Places library. Include the libraries=places
      // parameter when you first load the API. For example:
      // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

      var map;

      function initMap() {
    	  var l=<%= request.getAttribute("lat")%>;
    	  var longi=<%= request.getAttribute("longi")%>;
        var pyrmont = {lat: l,lng : longi};

        map = new google.maps.Map(document.getElementById('map'), {
          center: pyrmont,
          zoom: 17
        });

        var service = new google.maps.places.PlacesService(map);
	    var r=<%= request.getAttribute("radius")%>;
        service.nearbySearch({
          location: pyrmont,
          radius: r,
          type: ['<%= request.getAttribute("placeType")%>']
        }, processResults);
      }

      function processResults(results, status, pagination) {
        if (status !== google.maps.places.PlacesServiceStatus.OK) {
          return;
        } else {
          createMarkers(results);

          if (pagination.hasNextPage) {
            var moreButton = document.getElementById('more');

            moreButton.disabled = false;

            moreButton.addEventListener('click', function() {
              moreButton.disabled = true;
              pagination.nextPage();
            });
          }
        }
      }

      function createMarkers(places) {
        var bounds = new google.maps.LatLngBounds();
        var placesList = document.getElementById('places');

        for (var i = 0, place; place = places[i]; i++) {
          var image = {
            url: place.icon,
            size: new google.maps.Size(71, 71),
            origin: new google.maps.Point(0, 0),
            anchor: new google.maps.Point(17, 34),
            scaledSize: new google.maps.Size(25, 25)
          };

          var marker = new google.maps.Marker({
            map: map,
            icon: image,
            title: place.name,
            position: place.geometry.location
          });

          placesList.innerHTML += '<li>' + place.name + '</li>';

          bounds.extend(place.geometry.location);
        }
        map.fitBounds(bounds);
      }
    </script>
  </head>
  <body>
  <p style="float:right;text-decoration:underline;font-size:20px;color:black">
<% String username=(String)session.getAttribute("currentSessionUser");
out.print("Hi "+username+"!");%>
</p>
<h1>HealthyYou</h1>
<button style="font-size:20px;background-color:orange; color:black;margin-left:1em;border-radius:6px;"><a href="Home.jsp"  >>>Home</a></button>
<form style="margin-left:5em;margin-top:3em;" action="latLongFinder">
<select name="placeType" class="select">
  <option value="hospital">Hospitals</option>
  <option value="pharmacy">Pharmacies</option>
  <option value="gym">Gymnasiums</option>
</select>
<input type="text" name="city" value="" placeholder="Enter your city here:" required autofocus >
<input type="text" name="radius" value="" id="radius" placeholder="Enter radius:" required >
<input type="submit" name="Find" value="Find"  class="submit">
</form>	
    <div id="map"></div>
    <div id="right-panel">
      <h2>Results</h2>
      <ul id="places" class="ulclass"></ul>
      <button id="more">More results</button>
    </div>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD0s-YhWq05wp7IUWM7IkC658KMoelgB4o&libraries=places&callback=initMap" async defer></script>
  </body>
</html>