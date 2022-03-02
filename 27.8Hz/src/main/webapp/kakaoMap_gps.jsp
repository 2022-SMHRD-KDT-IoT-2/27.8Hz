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
		//������ �浵 �� �޾ƿ���
		String lat = request.getParameter("LAT");
		String lon = request.getParameter("LON");
		double r_lat = 0;
		double r_lon = 0;
		
		//�Ǽ��� �Ҽ��� ���� ��ȯ Ŭ����
		DecimalFormat df  = new DecimalFormat("0.0000");
		
		GpsDAO dao = new GpsDAO();
		GpsVO vo = dao.selectVal();
		
		if(!(lat == null && lon == null)){
			
			//���ڿ� �浵, ���� �Ǽ������� ��ȯ
			r_lat = Integer.parseInt(lat) / 1000000.0;
			r_lon = Integer.parseInt(lon) / 1000000.0;
			
			//r_lat, r_lon Ÿ�� ��ȯ
			double x = Double.parseDouble(df.format(r_lat));
			double y = Double.parseDouble(df.format(r_lon));
			//System.out.println("x      = " + x + " y      = " + y);
			
			//db�� �� ������ �����浵 �� ��������
			double getLat = Double.parseDouble(df.format(vo.getLat()));
			double getLon = Double.parseDouble(df.format(vo.getLon()));
			//System.out.println("getLat = " + getLat + " getLon = " + getLon);
			
			//���簡���� �����浵���� db������ �����浵���� �������� ��
			if(!(x==getLat && y==getLon)){
				dao.insertVal(r_lat, r_lon);
				System.out.println("dao.insertVal() ����Ϸ�!");
				//System.out.println("GpsVO LAT = " + vo.getLat() + " GpsVO LON = " + vo.getLon());				
			}
			//System.out.println("LAT = " + r_lat + " LON = " + r_lon);			
		}
	%>
	
	<div class="map_wrap">
	    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
	    <div class="hAddr">
	        <span class="title">�����߽ɱ��� ������ �ּ�����</span>
	        <span id="centerAddr"></span>
	    </div>
	</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4c3aed63b12ab2792059ca71430ad441&libraries=services"></script>
	<script>
		
		//���� �浵 ����
		var lat = <%=vo.getLat() %>;
		var lon = <%=vo.getLon() %>;
		
		console.log(lat);
		console.log(lon);
		
		// ��Ŀ�� Ŭ���ϸ� ��Ҹ��� ǥ���� ���������� �Դϴ�
		var infowindow = new kakao.maps.InfoWindow({zIndex:1});
		
		var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
		    mapOption = {
		        center: new kakao.maps.LatLng(lat, lon), // ������ �߽���ǥ
		        level: 3 // ������ Ȯ�� ����
		    };  
		
		// ������ �����մϴ�    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		// �ּ�-��ǥ ��ȯ ��ü�� �����մϴ�
		var geocoder = new kakao.maps.services.Geocoder();
		
		var marker = new kakao.maps.Marker(), // Ŭ���� ��ġ�� ǥ���� ��Ŀ�Դϴ�
		    infowindow = new kakao.maps.InfoWindow({zindex:1}); // Ŭ���� ��ġ�� ���� �ּҸ� ǥ���� �����������Դϴ�
		  
		// ��Ŀ�� ǥ�õ� ��ġ�Դϴ� 
		var markerPosition  = new kakao.maps.LatLng(lat, lon); 
		
		    
		// ��Ŀ�� �����մϴ�
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});
		
		// ��Ŀ�� ���� ���� ǥ�õǵ��� �����մϴ�
		marker.setMap(map);    
		 
		
		
		// ���� ���� �߽���ǥ�� �ּҸ� �˻��ؼ� ���� ���� ��ܿ� ǥ���մϴ�
		searchAddrFromCoords(map.getCenter(), displayCenterInfo);
		
		// ������ Ŭ������ �� Ŭ�� ��ġ ��ǥ�� ���� �ּ������� ǥ���ϵ��� �̺�Ʈ�� ����մϴ�
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
		    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
		        if (status === kakao.maps.services.Status.OK) {
		            var detailAddr = !!result[0].road_address ? '<div>���θ��ּ� : ' + result[0].road_address.address_name + '</div>' : '';
		            detailAddr += '<div>���� �ּ� : ' + result[0].address.address_name + '</div>';
		            
		            var content = '<div class="bAddr">' +
		                            '<span class="title">�ּ�����</span>' + 
		                            detailAddr + 
		                        '</div>';
		
		            // ��Ŀ�� Ŭ���� ��ġ�� ǥ���մϴ� 
		            marker.setPosition(mouseEvent.latLng);
		            marker.setMap(map);
		
		            // ���������쿡 Ŭ���� ��ġ�� ���� ������ �� �ּ������� ǥ���մϴ�
		            infowindow.setContent(content);
		            infowindow.open(map, marker);
		        }   
		    });
		});
		
		// �߽� ��ǥ�� Ȯ�� ������ ������� �� ���� �߽� ��ǥ�� ���� �ּ� ������ ǥ���ϵ��� �̺�Ʈ�� ����մϴ�
		kakao.maps.event.addListener(map, 'idle', function() {
		    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
		});
		
		function searchAddrFromCoords(coords, callback) {
		    // ��ǥ�� ������ �ּ� ������ ��û�մϴ�
		    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
		}
		
		function searchDetailAddrFromCoords(coords, callback) {
		    // ��ǥ�� ������ �� �ּ� ������ ��û�մϴ�
		    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
		}
		
		// ���� ������ܿ� ���� �߽���ǥ�� ���� �ּ������� ǥ���ϴ� �Լ��Դϴ�
		function displayCenterInfo(result, status) {
		    if (status === kakao.maps.services.Status.OK) {
		        var infoDiv = document.getElementById('centerAddr');
		
		        for(var i = 0; i < result.length; i++) {
		            // �������� region_type ���� 'H' �̹Ƿ�
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