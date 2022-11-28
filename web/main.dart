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

   //Recall function drawlines for each line
   for (int i = 0; i < nLines; i++) {
    //  drawLines(canvas.width, canvas.height, ctx, nLines, maxCharsPerLine, i, lines[i]);
    drawCircle(canvas.width, canvas.height, ctx, nLines, maxCharsPerLine, i, lines[i]);
  }//
 }

//Draw line calculating for each time height and width
void drawLines(var width, var height, CanvasRenderingContext2D ctx,
    int nLines, int maxCharsPerLine, int linenumber, String line){
  int posY = height ~/ nLines * (linenumber + 1);
  var segmentLength = width / maxCharsPerLine;

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

// void cerchio(num x, num y, len){
//   var centro = Point(500,500);
//   var p;
//   //num x = 0;
//   //num y = 0;
//   for(num i=0; i<360; i = i + 3){
//     if(i%2==0)
//     {
//       x = centro.x + 400 * cos((i*pi)/180);
//       y = centro.y + 400 * sin((i*pi)/180);
//       p = Point(x,y);
//       ctx
//         ..beginPath()
//         ..rect(p.x,p.y,len+10,2)
//         ..stroke()
//         ..closePath();
//     }
//   }
// }

void drawCircle(var width, var height, CanvasRenderingContext2D ctx,
    int nLines, int maxCharsPerLine, int linenumber, String line){
  var centro = Point(500,500);
  var segmentLength = width / maxCharsPerLine;

  var p;
  num x = 0;
  num y = 0;
  // x = centro.x + 250 * cos(((360)*pi)/180);
  // y = centro.y + 250 * sin(((360)*pi)/180);
  // p = Point(x,y);
  // ctx
  //   ..beginPath()
  //   ..rect(p.x,p.y,2,2)
  //   ..stroke()
  //   ..closePath();
  for(num i=0.0; i<360; i = i + 3){
    // if((70<i && i<110 && i%2==0)){
    //   x = centro.x + 250 * cos(((i)*pi)/180);
    //   y = centro.y + 250 * sin(((i)*pi)/180);
    //   p = Point(x,y);
    //   ctx
    //     ..beginPath()
    //     ..rect(p.x,p.y,20,2)
    //     ..stroke()
    //     ..closePath();
    // }else if(70<i && i<110){
    //
    // }else
    if(i%2==0)
    {
    x = centro.x + 400 * cos((i*pi)/180);
    y = centro.y + 400 * sin((i*pi)/180);
    p = Point(x,y);
    drawLine(x, y, segmentLength);
    // ctx
    //   ..beginPath()
    //   ..fillText("Ciao", p.x, p.y)
    //   ..rect(p.x,p.y,25,2)
    //   ..stroke()
    //   ..closePath();
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
