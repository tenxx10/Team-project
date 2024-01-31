/**
 * 
 */

// 아이콘 설정 A,B,C,D ...

var HOME_PATH = window.HOME_PATH || '.';


var map = new naver.maps.Map(document.getElementById('map'), {
        zoom: 16,
        center: new naver.maps.LatLng(35.2053848, 129.0765058)
    });

var latlngs = [
  // 보건소 위치
  new naver.maps.LatLng(35.2053848, 129.0765058), // 부산동부지부(동래)의 좌표
  new naver.maps.LatLng(35.1580273, 128.9865896), // 서부지부 좌표
  new naver.maps.LatLng(35.3359792, 129.1779167), // 기장군보건소 정관지소 좌표
new naver.maps.LatLng(35.1462124, 129.0598705), // 부산진구 보건소 좌표
new naver.maps.LatLng(35.1360966, 129.0849714), // 부산남구 보건소 좌표
new naver.maps.LatLng(35.129344, 129.0449072), // 부산동구 보건소 좌표
new naver.maps.LatLng(35.1768327, 129.0791413), // 연제구 보건소 좌표
new naver.maps.LatLng(35.1075364, 129.0180887), // 부산서구 보건소 좌표
new naver.maps.LatLng(35.1625694, 129.1135604), // 수영구 보건소 좌표
new naver.maps.LatLng(35.1062022, 129.0323394), // 부산 중구 보건소 좌표
new naver.maps.LatLng(35.152417, 128.992039), // 사상구 보건소 좌표
new naver.maps.LatLng(35.2113842, 129.0798625), // 동래구 보건소 좌표
new naver.maps.LatLng(35.1641139, 129.1786601), // 해운대구 보건소 재반보건지소 좌표
new naver.maps.LatLng(35.21284, 129.0142908), // 덕천보건지소 좌표
new naver.maps.LatLng(35.0787475, 129.064765), // 영도 보건지소 좌표
new naver.maps.LatLng(35.2420475, 129.0924716), // 금정구 보건소 좌표
new naver.maps.LatLng(37.5496053, 126.868277), // 부산 강서구 보건소 좌표
new naver.maps.LatLng(35.2392384, 129.0147818), // 부산북구 보건소 좌표
new naver.maps.LatLng(35.0943098, 128.9594344), // 사하구 보건소 좌표
new naver.maps.LatLng(35.2296889, 129.1475501), // 해운대구 보건소 반송보건지소 좌표
new naver.maps.LatLng(35.1641139, 129.1786601), // 해운대구 보건소 좌표
new naver.maps.LatLng(35.2322489, 128.8708565), // 김해시 보건소 좌표
new naver.maps.LatLng(35.2443043, 129.2225796), // 기장군 보건소 좌표
new naver.maps.LatLng(35.3357612, 129.0250101) // 양산시 보건소 좌표

];

        
var markerList = [];

for (var i=0, ii=latlngs.length; i<ii; i++) {
    var icon = {
            url: HOME_PATH +'/img/example/sp_pins_spot_v3.png', 
            //https://map.naver.com/v5/assets/img/sprites/marker@2x.png?t=1576139494322
            //이거 사용해도 된다고 함
            size: new naver.maps.Size(24, 37),
            anchor: new naver.maps.Point(12, 37),
            origin: new naver.maps.Point(i * 29, 0)
        },
        marker = new naver.maps.Marker({
            position: latlngs[i],
            map: map,
            icon: icon
        });
        

    marker.set('seq', i);

    markerList.push(marker);

    marker.addListener('mouseover', onMouseOver);
    marker.addListener('mouseout', onMouseOut);

    icon = null;
    marker = null;
}

function onMouseOver(e) {
    var marker = e.overlay,
        seq = marker.get('seq');

    marker.setIcon({
        url: HOME_PATH +'/img/example/sp_pins_spot_v3_over.png',
        size: new naver.maps.Size(24, 37),
        anchor: new naver.maps.Point(12, 37),
        origin: new naver.maps.Point(seq * 29, 50)
    });
}

function onMouseOut(e) {
    var marker = e.overlay,
        seq = marker.get('seq');

    marker.setIcon({
        url: HOME_PATH +'/img/example/sp_pins_spot_v3.png',
        size: new naver.maps.Size(24, 37),
        anchor: new naver.maps.Point(12, 37),
        origin: new naver.maps.Point(seq * 29, 0)
    });
}




var busanLocation = new naver.maps.LatLng(35.2053848, 129.0765058); // 부산동부지부(동래)의 좌표
var westLocation = new naver.maps.LatLng(35.1580273, 128.9865896); // 서부지부 좌표
var gijangLocation = new naver.maps.LatLng(35.2443043, 129.2225796); // 기장군보건소 정관지소 좌표
var jinguLocation = new naver.maps.LatLng(35.1462124, 129.0598705); // 부산진구보건소보건소 좌표
var dongraeLocation = new naver.maps.LatLng(35.2113842, 129.0798625); // 동래구보건소 좌표
var bukguLocation = new naver.maps.LatLng(35.2392384, 129.0147818); // 부산북구보건소 좌표
var sahaLocation = new naver.maps.LatLng(35.0943098, 128.9594344); // 사하구보건소 좌표
var namLocation = new naver.maps.LatLng(35.1360966, 129.0849714); // 남구보건소 좌표
var haeundaeLocation = new naver.maps.LatLng(35.1641139, 129.1786601); // 해운대구보건소 좌표
var yeonjeLocation = new naver.maps.LatLng(35.1768327, 129.0791413); // 연제구보건소 좌표
var bansongLocation = new naver.maps.LatLng(35.2296889, 129.1475501); // 반송보건지소 좌표
var yeongdoLocation = new naver.maps.LatLng(35.0787475, 129.064765); // 영도
var sasangLocation = new naver.maps.LatLng(35.152417, 128.992039); // 사상구
var seoguLocation = new naver.maps.LatLng(35.1075364, 129.0180887); // 서구
var gangseoLocation = new naver.maps.LatLng(37.5496053, 126.868277); // 강서구
var suyeongLocation = new naver.maps.LatLng(35.1625694, 129.1135604); // 수영구
var gimhaeLocation = new naver.maps.LatLng(35.2322489, 128.8708565); // 김해시
var jungguLocation = new naver.maps.LatLng(35.1062022, 129.0323394); // 중구
var dongguLocation = new naver.maps.LatLng(35.129344, 129.0449072); // 동구
var geumjeongLocation = new naver.maps.LatLng(35.2420475, 129.0924716); // 금정구
var deokcheonLocation = new naver.maps.LatLng(35.21284, 129.0142908); // 덕천




//각 보건소에 대한 마커 생성
var busanMarker = new naver.maps.Marker({
  position: busanLocation,
  map: map
});

var westMarker = new naver.maps.Marker({
  position: westLocation,
  map: map
});

var gijangMarker = new naver.maps.Marker({
  position: giyangLocation,
  map: map
});

var jinguMarker = new naver.maps.Marker({
  position: jinguLocation,
  map: map
});

var dongraeMarker = new naver.maps.Marker({
  position: dongraeLocation,
  map: map
});

var sahaMarker = new naver.maps.Marker({
  position: sahaLocation,
  map: map
});

var namMarker = new naver.maps.Marker({
  position: namLocation,
  map: map
});

var haeundaeMarker = new naver.maps.Marker({
  position: haeundaeLocation,
  map: map
});

var yeonjeMarker = new naver.maps.Marker({
  position:  yeonjeLocation,
  map: map
});

var bansongMarker = new naver.maps.Marker({
  position: bansongLocation,
  map: map
});

// 각 보건소에 대한 마커 생성
var yeongdoMarker = new naver.maps.Marker({
  position: yeongdoLocation,
  map: map
});

var sasangMarker = new naver.maps.Marker({
  position: sasangLocation,
  map: map
});

var seoguMarker = new naver.maps.Marker({
  position: seoguLocation,
  map: map
});

var gangseoMarker = new naver.maps.Marker({
  position: gangseoLocation,
  map: map
});

var suyeongMarker = new naver.maps.Marker({
  position: suyeongLocation,
  map: map
});

var gimhaeMarker = new naver.maps.Marker({
  position: gimhaeLocation,
  map: map
});

var jungguMarker = new naver.maps.Marker({
  position: jungguLocation,
  map: map
});

var dongguMarker = new naver.maps.Marker({
  position: dongguLocation,
  map: map
});

var geumjeongMarker = new naver.maps.Marker({
  position: geumjeongLocation,
  map: map
});

var deokcheonMarker = new naver.maps.Marker({
  position: deokcheonLocation,
  map: map
});




// 각 보건소에 대한 정보창 생성
var busanInfowindow = new naver.maps.InfoWindow({
  content: 'Information about Busan Health Center'
});


// 보건소
naver.maps.Event.addListener(busanMarker, "click", function(e) {
  toggleInfowindow(busanInfowindow, busanMarker);
});

naver.maps.Event.addListener(westMarker, "click", function(e) {
  toggleInfowindow(busanInfowindow, westMarker);
});

naver.maps.Event.addListener(gijangMarker, "click", function(e) {
  toggleInfowindow(busanInfowindow, gijangMarker);
});

naver.maps.Event.addListener(jinguMarker, "click", function(e) {
  toggleInfowindow(busanInfowindow, jinguMarker);
});

naver.maps.Event.addListener(dongraeMarker, "click", function(e) {
  toggleInfowindow(busanInfowindow, dongraeMarker);
});

naver.maps.Event.addListener(sahaMarker, "click", function(e) {
  toggleInfowindow(busanInfowindow, sahaMarker);
});

naver.maps.Event.addListener(namMarker, "click", function(e) {
  toggleInfowindow(busanInfowindow, namMarker);
});

naver.maps.Event.addListener(haeundaeMarker, "click", function(e) {
  toggleInfowindow(busanInfowindow, haeundaeMarker);
});

naver.maps.Event.addListener(yeonjeMarker, "click", function(e) {
  toggleInfowindow(busanInfowindow, yeonjeMarker);
});

naver.maps.Event.addListener(bansongMarker, "click", function(e) {
  toggleInfowindow(busanInfowindow, bansongMarker);
});


// 추가 보건소에 대한 클릭 이벤트 리스너 추가
naver.maps.Event.addListener(yeongdoMarker, "click", function(e) {
  toggleInfowindow(yeongdoInfowindow, yeongdoMarker);
});

naver.maps.Event.addListener(sasangMarker, "click", function(e) {
  toggleInfowindow(sasangInfowindow, sasangMarker);
});

naver.maps.Event.addListener(seoguMarker, "click", function(e) {
  toggleInfowindow(seoguInfowindow, seoguMarker);
});

naver.maps.Event.addListener(gangseoMarker, "click", function(e) {
  toggleInfowindow(gangseoInfowindow, gangseoMarker);
});

naver.maps.Event.addListener(suyeongMarker, "click", function(e) {
  toggleInfowindow(suyeongInfowindow, suyeongMarker);
});

naver.maps.Event.addListener(gimhaeMarker, "click", function(e) {
  toggleInfowindow(gimhaeInfowindow, gimhaeMarker);
});

naver.maps.Event.addListener(jungguMarker, "click", function(e) {
  toggleInfowindow(jungguInfowindow, jungguMarker);
});

naver.maps.Event.addListener(dongguMarker, "click", function(e) {
  toggleInfowindow(dongguInfowindow, dongguMarker);
});

naver.maps.Event.addListener(geumjeongMarker, "click", function(e) {
  toggleInfowindow(geumjeongInfowindow, geumjeongMarker);
});

naver.maps.Event.addListener(deokcheonMarker, "click", function(e) {
  toggleInfowindow(deokcheonInfowindow, deokcheonMarker);
});

// 정보창 열고 닫는 함수
function toggleInfowindow(infowindow, marker) {
  if (infowindow.getMap()) {
    infowindow.close();
  } else {
    infowindow.open(map, marker);
  }
}


// 마커 클릭 이벤트 리스너 등록
naver.maps.Event.addListener(busanMarker, "click", function(e) {
  if (busanInfowindow.getMap()) {
    busanInfowindow.close();
  } else {
    busanInfowindow.open(map, busanMarker);
  }
});

naver.maps.Event.addListener(westMarker, "click", function(e) {
  if (busanInfowindow.getMap()) {
    busanInfowindow.close();
  } else {
    busanInfowindow.open(map, westMarker);
  }
});

naver.maps.Event.addListener(gijangMarker, "click", function(e) {
  if (busanInfowindow.getMap()) {
    busanInfowindow.close();
  } else {
    busanInfowindow.open(map, gijangMarker);
  }
});

naver.maps.Event.addListener(jinguMarker, "click", function(e) {
  if (busanInfowindow.getMap()) {
    busanInfowindow.close();
  } else {
    busanInfowindow.open(map, jinguMarker);
  }
});

naver.maps.Event.addListener(dongraeMarker, "click", function(e) {
  if (busanInfowindow.getMap()) {
    busanInfowindow.close();
  } else {
    busanInfowindow.open(map, dongraeMarker);
  }
});

naver.maps.Event.addListener(sahaMarker, "click", function(e) {
  if (busanInfowindow.getMap()) {
    busanInfowindow.close();
  } else {
    busanInfowindow.open(map, sahaMarker);
  }
});

naver.maps.Event.addListener(namMarker, "click", function(e) {
  if (busanInfowindow.getMap()) {
    busanInfowindow.close();
  } else {
    busanInfowindow.open(map, namMarker);
  }
});

naver.maps.Event.addListener(haeundaeMarker, "click", function(e) {
  if (busanInfowindow.getMap()) {
    busanInfowindow.close();
  } else {
    busanInfowindow.open(map, haeundaeMarker);
  }
});

naver.maps.Event.addListener(yeonjeMarker, "click", function(e) {
  if (busanInfowindow.getMap()) {
    busanInfowindow.close();
  } else {
    busanInfowindow.open(map, yeonjeMarker);
  }
});

naver.maps.Event.addListener(bansongMarker, "click", function(e) {
  if (busanInfowindow.getMap()) {
    busanInfowindow.close();
  } else {
    busanInfowindow.open(map, bansongMarker);
  }
});


