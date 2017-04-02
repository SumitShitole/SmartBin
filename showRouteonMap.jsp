<%-- 
    Document   : showRouteonMap
    Created on : 1 Apr, 2017, 10:50:39 AM
    Author     : Sumit
--%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="dbConnection.jsp" %>
<html>
<head>
 <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <title>Google Maps</title>
    <style type="text/css">
        body { font: normal 10pt Helvetica, Arial; }
        div.m{ width: 100%; height: 83%; border: 0px; padding: 0px; }
        #map-canvas { width: 100%; height: 80%; border: 0px; padding: 0px; }
    </style>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD1C3c6iMc4XupGd2HErmKY6ZWN05nqCm8&sensor=false"></script>
    <script type="text/javascript">    
function initMap(a1,a2,b1,b2) {
	var pointA = new google.maps.LatLng(a1, a2),
    pointB = new google.maps.LatLng(b1, b2),
	//pointC = new google.maps.LatLng(55.8429, -5.1313),
    myOptions = {
      zoom: 7,
      center: pointA
    },
    map = new google.maps.Map(document.getElementById('map-canvas'), myOptions),
    // Instantiate a directions service.
    directionsService = new google.maps.DirectionsService,
    directionsDisplay = new google.maps.DirectionsRenderer({
      map: map
    }),
    markerA = new google.maps.Marker({
      position: pointA,
      title: "Source",
	  animation: google.maps.Animation.DROP,
      label: "Source",
      map: map
    }),
    markerB = new google.maps.Marker({
      position: pointB,
      title: "Destination",
      label: "Destination",
	  animation: google.maps.Animation.DROP,
      map: map
    });
	google.maps.event.addListener(pointA, "click", function() {
                if (currentPopup != null) {
                    currentPopup.close();
                      currentPopup = null;
                   }
                   popup.open(map, pointA);
                    currentPopup = popup;
                   });
	google.maps.event.addListener(pointA, "click", function() {
		if (currentPopup != null) {
			currentPopup.close();
			currentPopup = null;
           }
           popup.open(map, pointB);
           currentPopup = popup;
	});
	var trafficLayer = new google.maps.TrafficLayer();
        trafficLayer.setMap(map);
  // get route from A to B
  calculateAndDisplayRoute(directionsService, directionsDisplay, pointA, pointB);
  //calculateAndDisplayRoute(directionsService, directionsDisplay, pointB, pointC);
}
function calculateAndDisplayRoute(directionsService, directionsDisplay, pointA, pointB) {
  directionsService.route({
    origin: pointA,
    destination: pointB,
    travelMode: google.maps.TravelMode.DRIVING
  }, function(response, status) {
    if (status == google.maps.DirectionsStatus.OK) {
      directionsDisplay.setDirections(response);
    } else {
      window.alert('Directions request failed due to ' + status);
    }
  });
}

function startMap(){
	<%
        List<String> lgarr = new ArrayList<String>();
        List<String> ltarr = new ArrayList<String>();
        int i = 0;
        statement = connection.createStatement();
        String Data = "SELECT * FROM bins where status='1' order by latitude;";
        rs=statement.executeQuery(Data);
        while(rs.next())
        {
            lgarr.add(rs.getString("longitude"));
            ltarr.add(rs.getString("latitude"));
            i++;
        }
        %>
}
   </script> 
  </head>
    <body onLoad="startMap()" >
	<table cellspacing="2" cellpadding="3">
	<tr>
	 <%
        int y=0;
	for(int x = 0; x < (ltarr.size()-1); x++) {
            y=(x+1);
	%>
	<td style="border-style: solid;border-color: #ffffff;">
            <button onclick="initMap(<%=ltarr.get(x)%>,<%=lgarr.get(x)%>,<%=ltarr.get(y)%>,<%=lgarr.get(y)%>);">Route<%=y%></button>
	</td>
	<% } %> 
	</tr>
	</table>
        <div id="map-canvas" class="m"></div>
    </body>
 </html>