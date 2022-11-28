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
   int nLines, int maxCharsPerLine, var lines){
   var segmentLength = width / maxCharsPerLine;
   var check = 0;
   num lun = 0;
   List<Point> punti = [];
   createPoint(punti);
   for(int i=0; i < punti.length;i++){
     check = lines[i].length;
     lun = width/ check;
     print("W " + width.toString());
     print("C " + check.toString());
     print("L " + lun.toString());
     drawLine(punti[i].x, punti[i].y, segmentLength, lun);
   }
 }

void drawLine(x, y, maxlen, len){
  ctx
    ..beginPath()
    ..lineWidth = 3
    ..moveTo(x, y)
    ..lineTo(x + len, y)
    ..lineCap = 'round'
    ..stroke()
    ..closePath()
  ;
}

void createPoint(var punti){
  var centro = Point(500,500);
  num x = 0;
  num y = 0;
  for(num i = 0.0; i<360; i = i+3)
  {
    if(i%2==0){
      x = centro.x + 400 * cos((i*pi)/180);
      y = centro.y + 400 * sin((i*pi)/180);
      punti.add(Point(x,y));
    }
  }
}

void main() {
//path csv

//  String file = "Alice.csv";
  // drawCircle(var width, var height, CanvasRenderingContext2D ctx,
  //   int nLines, int maxCharsPerLine, int linenumber, String line);
//HttpRequest
  var request = HttpRequest.getString("Alice.txt").then(processText);

}
