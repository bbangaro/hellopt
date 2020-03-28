var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스

// 기본좌표 백암빌딩 설정
var latitude = 37.503252; // 위도
var longitude = 127.024342; // 경도

// geolocationAPI를 사용하여 현재 위치를 가져온다
if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function (position) { // geolocation을 이용해서 접속 위치를 얻어옵니다.
        latitude = position.coords.latitude;
        longitude = position.coords.longitude;

        var locPosition = new kakao.maps.LatLng(latitude, longitude);
        map.setCenter(locPosition);
    });
} else {
    console.log("geolocaion을 사용할 수 없습니다.");
}

var options = { //지도를 생성할 때 필요한 기본 옵션
    center: new kakao.maps.LatLng(latitude, longitude), //지도의 중심좌표.
    level: 3 //지도의 레벨(확대, 축소 정도)
};

function httpGetAsync(theUrl, callback) {
    var xmlHttp = new XMLHttpRequest();
    xmlHttp.onreadystatechange = function () {
        if (xmlHttp.readyState == 4 && xmlHttp.status == 200)
            callback(xmlHttp.responseText);
    }
    xmlHttp.open("GET", theUrl, true); // true for asynchronous 
    xmlHttp.send(null);
}

