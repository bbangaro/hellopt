/* 모임 작성 버튼 */

(function () {

  $(document).ready(function () {
    return $('."meeting-button2"').click(function () {
 
    	location.href="/hellopt/meeting";
      
    });
  });

}).call(this);





/* 지도 api 설정하기 */

var mapContainer = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
var mapOptions = { //지도를 생성할 때 필요한 기본 옵션
	center: new kakao.maps.LatLng(37.50312464278207, 127.02448266126561), //지도의 중심좌표.
	level: 3 //지도의 레벨(확대, 축소 정도)
};



var map = new kakao.maps.Map(mapContainer, mapOptions); //지도 생성 및 객체 리턴



/*

//주소-좌표 변환 객체 생성
var geocoder = new kakao.maps.services.Geocoder();

//주소로 좌표 검색
function add_search(){
	
	var add_search = document.getElementById('search_name').value;
	var y;
	var x;
	
	geocoder.addressSearch(add_search, function(result,status) {
		
		//정상 검색 되면
		if (status === kakao.maps.services.Status.OK){
			var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			
			//결과값으로 받은 위치 마커 표시
			var marker = new kakao.maps.Marker({
				map:map,
				position:coords
			});
				y = result[0].y;
				x = result[0].x;
				document.getElementById('mLocation').value = y +','+ x ;
			
				//인포윈도우로 장소에 대한 설명 표시
			var infowindow = new kakao.maps.InfoWindow({
				content:'<div style="color:black; width:150px; text-align:center; padding:6px 0;">'+add_search+'</div>'
			});
			infowindow.open(map, marker);
			
			//지도의 중심을 결과값으로 받은 위치로 이동
			map.setCenter(coords);
		}
	});
	
}
 */

function getAddress() {
	new daum.Postcode({
		oncomplete: function(data) {
			let search_name = data.roadAddress;
			document.getElementById('search_name').value = search_name;
			
			var geocoder = new kakao.maps.services.Geocoder();

			if (document.getElementById('search_name').value !== null){
				var add_search = document.getElementById('search_name').value;
				var y;
				var x;
				
				geocoder.addressSearch(add_search, function(result,status) {
					
					//정상 검색 되면
					if (status === kakao.maps.services.Status.OK){
						var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
						
						//결과값으로 받은 위치 마커 표시
						var marker = new kakao.maps.Marker({
							map:map,
							position:coords
						});
						y = result[0].y;
						x = result[0].x;
						document.getElementById('mLocation').value = y +','+ x ;
						
						//인포윈도우로 장소에 대한 설명 표시
						var infowindow = new kakao.maps.InfoWindow({
							content:'<div style="color:black; width:150px; text-align:center; padding:6px 0;">'+add_search+'</div>'
						});
						infowindow.open(map, marker);
						
						//지도의 중심을 결과값으로 받은 위치로 이동
						map.setCenter(coords);
					}
				});
			}
		}
	}).open();
	
}	
	