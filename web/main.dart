import 'dart:html';
import 'package:csv/csv.dart';
import 'dart:convert';
import 'dart:math';


var canvas = document.querySelector('canvas') as CanvasElement ;
var ctx = canvas.getContext('2d') as CanvasRenderingContext2D ;
var newEl = [];
const double pi = 3.1415926535897932;

 void processText(String file){
   int maxCharsPerLine = 0;
   var lines = file.split("\n");
   int nLines = lines.length;


   //Take max length of array
   for (int i = 0; i < nLines; i++) {
     if (lines[i].length > maxCharsPerLine) maxCharsPerLine = lines[i].length;
   }

    drawCircle(canvas.width, canvas.height, ctx, nLines, maxCharsPerLine, lines);
 }

void drawCircle(var width, var height, CanvasRenderingContext2D ctx,
  int nLines, int maxCharsPerLine, var testo){
  //var segmentLength = width / maxCharsPerLine;
  var check = 0;
  var index = 0;
  var riga = 0;
  var lunghezzaTesto = 0;
  List<Point> punti = [];
  lunghezzaTesto = calcolaDimTesto(testo);
  createPoint(punti, (360/(lunghezzaTesto+(lunghezzaTesto/30))), width, height);
  for(int i=0; i < punti.length;i++){
    riga = checkSpace(testo, index, testo.length);
    check = testo[riga].length;
    drawLine(punti[i].x, punti[i].y, check, i);
    index=riga;
    index++;
  }
}

int calcolaDimTesto(testo){
  var dim = 0;
  for(int i = 0; i<testo.length; i++){
    if(testo[i] != ""){
      dim++;
    }
  }
  return dim;
}

int checkSpace(var testo, var index, var maxTesto){
  bool flag = true;
  var i = index;
  while(flag == true){
    if(testo[i].length > 0){
      flag = false;
    }else{
      i++;
    }
  }
  return i;
}

void drawLine(x, y,len, indice){
  //TODO adesso tagliamo le parole per un amigliore rappresentazione
  //in realtà dovremmo adattare la lunghezza delle righe al canvas e al raggio del cerchio
  //più le fraasi sono lunghe, piu il cerchio risulterà largo ma adattato al canvas
  if(len > 80){
      len = 80;
  }
  if(len > 50){
     ctx.strokeStyle = 'grey'; //yellowgreen
  }else{
     ctx.strokeStyle = 'white'; //olive
  }
  ctx
    ..beginPath()
    ..lineWidth = 0.5
    ..moveTo(x, y)
    ..lineTo(x + len, y)
    ..lineCap = 'round'
    ..stroke()
    ..closePath()
  ;
}

void createPoint(var punti, var dim,int w,int h){
  var centro = Point(w/2,h/2);
  num x = 0;
  num y = 0;
  for(num i = -90.0; i<270; i = i+dim)
  {
      x = centro.x + 400 * cos((i*pi)/180);
      y = centro.y + 200 * sin((i*pi)/180);
      punti.add(Point(x,y));
  }
}

void main() {
  var request = HttpRequest.getString("Alice.txt").then(processText);

  var actualBtn = document.getElementById('actual-btn');

  var fileChosen = document.getElementById('file-chosen');

  var file = actualBtn?.addEventListener('change', (event) => fileChosen?.innerText = "Caricato");
  

}



