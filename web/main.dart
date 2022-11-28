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
  var segmentLength = width / maxCharsPerLine;
  var check = 0;
  num lun = 0;
  var index = 0;
  var riga = 0;
  List<Point> punti = [];
  createPoint(punti, 360/testo.length, width, height);

  for(int i=0; i < punti.length;i++){
    riga = checkSpace(testo, index);
    check = testo[riga].length;
    lun = width/ check;
    // print("W " + width.toString());
    // print("C " + check.toString());
    // print("L " + lun.toString());
    drawLine(punti[i].x, punti[i].y, segmentLength, lun);
    index++;
  }
}

int checkSpace(var testo, var index){
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

void drawLine(x, y, maxlen, len){
  //TODO adesso tagliamo le parole per un amigliore rappresentazione
  //in realtà dovremmo adattare la lunghezza delle righe al canvas e al raggio del cerchio
  //più le fraasi sono lunghe, piu il cerchio risulterà largo ma adattato al canvas
   if(len > 50){
     len = 50;
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
  for(num i = 0.0; i<360; i = i+dim)
  {
    //if(i%2==0){
      x = centro.x + 400 * cos((i*pi)/180);
      y = centro.y + 400 * sin((i*pi)/180);
      punti.add(Point(x,y));
    //}
  }
  print(punti.length);
}

void main() {
//path csv

//  String file = "Alice.csv";
  // drawCircle(var width, var height, CanvasRenderingContext2D ctx,
  //   int nLines, int maxCharsPerLine, int linenumber, String line);
//HttpRequest
  var request = HttpRequest.getString("Alice.txt").then(processText);

}
