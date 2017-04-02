<html>
<%@ page import="java.sql.*,java.io.*"%>
<%@include file="checkCache.jsp" %>
<%@include file="dbConnection.jsp" %>
<head>
 <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <title>Google Maps</title>

<!-------- Customizable Css for Map  ----------------------------->
    <style type="text/css">
        body { font: normal 10pt Helvetica, Arial; }
        #map { width: 100%; height: 80%; border: 0px; padding: 0px; }
    </style>

    <!---------------- Java Scripts for Map  ----------------->
    
	<script src="http://maps.google.com/maps/api/js?key=AIzaSyAXylpRAuz8ABIRT9X0ovUJaXB6Iwdu6bA&sensor=false" type="text/javascript"></script>

    <!------------- Java Scripts for Map  ------------------->
    <script type="text/javascript">

    //--------------------- Sample code written by vIr ------------
    var icon = new google.maps.MarkerImage("http://maps.google.com/mapfiles/ms/micons/blue.png",
               new google.maps.Size(32, 32), new google.maps.Point(0, 0),
               new google.maps.Point(16, 32));
                    var center = null;
                    var map = null;
                    var currentPopup;
                    var bounds = new google.maps.LatLngBounds();
                    function addMarker(lat, lng, info) {
                        var pt = new google.maps.LatLng(lat, lng);
                        bounds.extend(pt);
                        var marker = new google.maps.Marker({
                            position: pt,
                            icon: icon,
                            map: map
                        });
                        var popup = new google.maps.InfoWindow({
                            content: info,
                            maxWidth: 300
                        });
                        google.maps.event.addListener(marker, "click", function() {
                            if (currentPopup != null) {
                                currentPopup.close();
                                currentPopup = null;
                            }
                            popup.open(map, marker);
                            currentPopup = popup;
                        });
                        google.maps.event.addListener(popup, "closeclick", function() {
                            map.panTo(center);
                            currentPopup = null;
                        });
                    }           
                    function initMap() {
                        map = new google.maps.Map(document.getElementById("map"), {

                            center: new google.maps.LatLng(0, 0),
                            zoom: 14,
                            mapTypeId: google.maps.MapTypeId.ROADMAP,
                            mapTypeControl: true,
                            mapTypeControlOptions: {
                                style: google.maps.MapTypeControlStyle.HORIZONTAL_BAR
                            },
                            navigationControl: true,
                            navigationControlOptions: {
                                style: google.maps.NavigationControlStyle.ZOOM_PAN
                            }
                        });

          <%
              try
	{
            statement = connection.createStatement();
            String Data = "SELECT * FROM bins where status='1';";
            rs=statement.executeQuery(Data);
            while(rs.next())
            {
                %>
                        addMarker(<%=rs.getDouble("latitude")%>, <%=rs.getDouble("longitude")%>, '<b><%=rs.getString("address")%></b><br/><%=rs.getString("Description")%>');
           <%
            }
            rs.close();
            statement.close();
            connection.close();
	} 
        catch (Exception ex) {
            ex.printStackTrace();
	}
	%>
   center = bounds.getCenter();
   map.fitBounds(bounds);

   }
   </script>
  </head>
    <body onLoad="initMap()" style="margin:0px; border:0px; padding:0px;">
       <div id="map"></div>
       
    </body>
 </html>