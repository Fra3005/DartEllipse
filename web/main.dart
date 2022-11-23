import 'dart:html';
import 'package:csv/csv.dart';
import 'dart:convert';


var canvas = document.querySelector('canvas') as CanvasElement ;
var ctx = canvas.getContext('2d') as CanvasRenderingContext2D ;
var newEl = [];



 void processText(String file){
   int maxCharsPerLine = 0;
   var lines = file.split("\n");
   int nLines = lines.length;

   //TODO: convertire in foreach per + prestazioni
   for (int i = 0; i < nLines; i++) {
     if (lines[i].length > maxCharsPerLine) maxCharsPerLine = lines[i].length;
   }

   for (int i = 0; i < nLines; i++) {
     drawLines(canvas.width, canvas.height, ctx, nLines, maxCharsPerLine, i, lines[i]);
   }
 }


void drawLines(var width, var height, CanvasRenderingContext2D ctx,
    int nLines, int maxCharsPerLine, int linenumber, String line){
  // print ("ho ricevuto i parametri del canvas: " + width.toString() + ", " + height.toString());
  int posY = height ~/ nLines * (linenumber + 1);
  var segmentLength = width / maxCharsPerLine;
  // var tokens = line.split(" ");
  for (int i = 0; i < line.length; i++){
    int posX = (segmentLength * i).toInt();
    if (line[i] != " ") drawLine(posX, posY, segmentLength);
  }
}

void drawLine(x, y, len){
  ctx
    ..lineWidth = 3
  // ..globalAlpha = .2
      ;
  ctx
    ..beginPath()
    ..moveTo(x, y)
    ..lineTo(x + len, y)
    ..lineCap = 'round'
    ..stroke()
    ..closePath()
  ;
}

void main() {
//path csv
//  String file = "Alice.csv";
//HttpRequest
  var request = HttpRequest.getString("Alice.txt").then(processText);

}
