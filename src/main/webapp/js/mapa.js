var map;
var idInfoBoxAberto;
var infoBox = [];
var markers = [];

var onibus_latitude = -4.97010591; 
var onibus_longitude = -39.01582549;

var onibus = new google.maps.LatLng(onibus_latitude, onibus_longitude);

function initialize() {	
	var latlng = new google.maps.LatLng(-4.97360371, -39.03250079);
	
    var options = {
        zoom: 14,
		center: latlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    map = new google.maps.Map(document.getElementById("mapa"), options);
}

initialize();

function abrirInfoBox(id, marker) {
	if (typeof(idInfoBoxAberto) == 'number' && typeof(infoBox[idInfoBoxAberto]) == 'object') {
		infoBox[idInfoBoxAberto].close();
	}

	infoBox[id].open(map, marker);
	idInfoBoxAberto = id;
}

function carregarPontos() {
	
	$.getJSON('../js/pontos.json', function(pontos) {
		
		var latlngbounds = new google.maps.LatLngBounds();
		
		$.each(pontos, function(index, ponto) {
			
			var marker = new google.maps.Marker({
				position: new google.maps.LatLng(ponto.Latitude, ponto.Longitude),
				title: "Meu ponto personalizado! :-D",
				icon: '../img/marcador.png'
			});
			
			var myOptions = {
				content: "<p>" + ponto.Descricao + "</p>",
				pixelOffset: new google.maps.Size(-150, 0)
        	};

			infoBox[ponto.Id] = new InfoBox(myOptions);
			infoBox[ponto.Id].marker = marker;
			
			infoBox[ponto.Id].listener = google.maps.event.addListener(marker, 'click', function (e) {
				abrirInfoBox(ponto.Id, marker);
			});
			
			markers.push(marker);
			
			latlngbounds.extend(marker.position);
			
		});
		
		var markerCluster = new MarkerClusterer(map, markers);
		
		map.fitBounds(latlngbounds);
		
	});
	
}

//pontos ida
var praca = new google.maps.LatLng(-4.97010591, -39.01582549);
var ufc = new google.maps.LatLng(-4.97949034, -39.05629466);
var basilio = new google.maps.LatLng(-4.97014866, -39.02410815);
var anexo = new google.maps.LatLng(-4.97007384, -39.01940892);

//pontos volta
var sinal = new google.maps.LatLng(-4.97082204, -39.02554582);
var igreja = new google.maps.LatLng(-4.97265511, -39.02257393);
var garimpeiro = new google.maps.LatLng(-4.97264976, -39.01955376);
var rodoviaria = new google.maps.LatLng(-4.97260167, -39.01637803);

var pontos = [praca, ufc, basilio, anexo, sinal, igreja, garimpeiro, rodoviaria];

var marker01 = new google.maps.Marker({
      position: praca,//seta posição
      map: map,//Objeto mapa
      title:"Parada: Praça do Leão",//string que será exibida quando passar o mouse no marker
      icon: "../img/marcador.png"
});

var marker02 = new google.maps.Marker({
      position: ufc,//seta posição
      map: map,//Objeto mapa
      title:"Parada: UFC - Campus Quixadá",//string que será exibida quando passar o mouse no marker
      icon: "../img/marcador.png"
});

var marker03 = new google.maps.Marker({
      position: basilio,//seta posição
      map: map,//Objeto mapa
      title:"Parada: Basílio Pinto",//string que será exibida quando passar o mouse no marker
      icon: "../img/marcador.png"
});

var marker04 = new google.maps.Marker({
      position: anexo,//seta posição
      map: map,//Objeto mapa
      title:"Parada: Anexo",//string que será exibida quando passar o mouse no marker
      icon: "../img/marcador.png"
});

var marker05 = new google.maps.Marker({
      position: sinal,//seta posição
      map: map,//Objeto mapa
      title:"Parada: Sinal",//string que será exibida quando passar o mouse no marker
      icon: "../img/marcador_volta.png"
});

var marker06 = new google.maps.Marker({
      position: igreja,//seta posição
      map: map,//Objeto mapa
      title:"Parada: Igreja Adventista",//string que será exibida quando passar o mouse no marker
      icon: "../img/marcador_volta.png"
});

var marker07 = new google.maps.Marker({
      position: garimpeiro,//seta posição
      map: map,//Objeto mapa
      title:"Parada: Churrascaria Garimpeiro",//string que será exibida quando passar o mouse no marker
      icon: "../img/marcador_volta.png"
});

var marker08 = new google.maps.Marker({
      position: rodoviaria,//seta posição
      map: map,//Objeto mapa
      title:"Parada: Rodoviária",//string que será exibida quando passar o mouse no marker
      icon: "../img/marcador_volta.png"
});

var idx = document.getElementById('indexloc').innerHTML;

var marker11 = new google.maps.Marker({
    position: pontos[parseInt(idx)],//seta posição
      map: map,//Objeto mapa
      title:"Parada: Rodoviária",//string que será exibida quando passar o mouse no marker
      icon: "../img/marcador_onibus.png"
});

// var marker09 = new google.maps.Marker({
//       position: ufc_volta,//seta posição
//       map: map,//Objeto mapa
//       title:"Parada: UFC - Campus Quixadá",//string que será exibida quando passar o mouse no marker
//       icon: "img/marcador_volta.png"
// });

// var marker10 = new google.maps.Marker({
//       position: praca_volta,//seta posição
//       map: map,//Objeto mapa
//       title:"Parada: Praça do Leão",//string que será exibida quando passar o mouse no marker
//       icon: "img/marcador_volta.png"
// });

carregarPontos();