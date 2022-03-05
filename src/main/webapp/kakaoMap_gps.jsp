<%@page import="java.text.DecimalFormat"%>
<%@page import="com.model.GpsVO"%>
<%@page import="com.model.GpsDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<style>
	    .map_wrap {position:relative;width:100%;height:350px;}
	    .title {font-weight:bold;display:block;}
	    .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
	    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
	    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
	</style>
</head>
<body>
	<%
		//위도와 경도 값 받아오기
		String lat = request.getParameter("LAT");
		String lon = request.getParameter("LON");
		double r_lat = 0;
		double r_lon = 0;
		
		//실수형 소수점 형식 변환 클래스
		DecimalFormat df  = new DecimalFormat("0.0000");
		
		GpsDAO dao = new GpsDAO();
		GpsVO vo = dao.selectVal();
		
		if(!(lat == null && lon == null)){
			
			//문자열 경도, 위도 실수형으로 변환
			r_lat = Integer.parseInt(lat) / 1000000.0;
			r_lon = Integer.parseInt(lon) / 1000000.0;
			
			//r_lat, r_lon 타입 변환
			double x = Double.parseDouble(df.format(r_lat));
			double y = Double.parseDouble(df.format(r_lon));
			//System.out.println("x      = " + x + " y      = " + y);
			
			//db에 들어간 마지막 위도경도 값 가져오기
			double getLat = Double.parseDouble(df.format(vo.getLat()));
			double getLon = Double.parseDouble(df.format(vo.getLon()));
			//System.out.println("getLat = " + getLat + " getLon = " + getLon);
			
			//현재가져온 위도경도값과 db마지막 위도경도값이 같지않을 때
			if(!(x==getLat && y==getLon)){
				dao.insertVal(r_lat, r_lon);
				System.out.println("dao.insertVal() 실행완료!");
				//System.out.println("GpsVO LAT = " + vo.getLat() + " GpsVO LON = " + vo.getLon());				
			}
			//System.out.println("LAT = " + r_lat + " LON = " + r_lon);			
		}
	%>
	
	<div class="map_wrap">
	    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
	    <div class="hAddr">
	        <span class="title">지도중심기준 행정동 주소정보</span>
	        <span id="centerAddr"></span>
	    </div>
	</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4c3aed63b12ab2792059ca71430ad441&libraries=services"></script>
	<script>
		
		//위도 경도 변수
		var lat = <%=vo.getLat() %>;
		var lon = <%=vo.getLon() %>;
		
		console.log(lat);
		console.log(lon);
		
		// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
		var infowindow = new kakao.maps.InfoWindow({zIndex:1});
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(lat, lon), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  
		
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
		    infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다
		  
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(lat, lon); 
		
		    
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});
		
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);    
		 
		
		
		// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
		searchAddrFromCoords(map.getCenter(), displayCenterInfo);
		
		// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
		    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
		        if (status === kakao.maps.services.Status.OK) {
		            var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
		            detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
		            
		            var content = '<div class="bAddr">' +
		                            '<span class="title">주소정보</span>' + 
		                            detailAddr + 
		                        '</div>';
		
		            // 마커를 클릭한 위치에 표시합니다 
		            marker.setPosition(mouseEvent.latLng);
		            marker.setMap(map);
		
		            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
		            infowindow.setContent(content);
		            infowindow.open(map, marker);
		        }   
		    });
		});
		
		// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'idle', function() {
		    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
		});
		
		function searchAddrFromCoords(coords, callback) {
		    // 좌표로 행정동 주소 정보를 요청합니다
		    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
		}
		
		function searchDetailAddrFromCoords(coords, callback) {
		    // 좌표로 법정동 상세 주소 정보를 요청합니다
		    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
		}
		
		// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
		function displayCenterInfo(result, status) {
		    if (status === kakao.maps.services.Status.OK) {
		        var infoDiv = document.getElementById('centerAddr');
		
		        for(var i = 0; i < result.length; i++) {
		            // 행정동의 region_type 값은 'H' 이므로
		            if (result[i].region_type === 'H') {
		                infoDiv.innerHTML = result[i].address_name;
		                break;
		            }
		        }
		    }    
		}
		
		
	</script>
	
</body>
</html>