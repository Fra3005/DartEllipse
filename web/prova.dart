import 'dart:html';
import 'package:csv/csv.dart';
import 'dart:convert';
import 'dart:math';

var pi = 3.14;
var a=120;
var b=70;
var c = document.querySelector('canvas') as CanvasElement ;
var ctx = c.getContext('2d') as CanvasRenderingContext2D ;

var xCentre=500;
var yCentre=500;

void main(){
  ctx
  ..strokeStyle='blue'
  ..beginPath()
  ..moveTo(0, yCentre)
  ..lineTo(xCentre*2, yCentre)
  ..stroke();

ctx
..beginPath()
..moveTo(xCentre, 0)
..lineTo(xCentre, yCentre*2)
..stroke()

// draw ellipse
..strokeStyle='black'

..beginPath();


for (var i = 0 * pi ; i < 2 * pi; i += 0.01 ) {
    var xPos = xCentre - (a * cos(i));
    var yPos = yCentre + (b * sin(i));
    if (i == 0) {
      
        ctx.moveTo(xPos, yPos);
    } else {
        ctx.lineTo(xPos, yPos);
    }

ctx
  ..lineWidth = 2
  ..strokeStyle = "#232323"
  ..stroke()
  ..closePath();


var deltaX=40;

var y1=b*sin(acos(deltaX/a));

ctx
..strokeStyle='red'
..beginPath()
..moveTo(xCentre+deltaX, yCentre-y1)
..lineTo(xCentre, yCentre)
..lineTo(xCentre-deltaX, yCentre-y1)
..stroke();

}

// draw axes



}

// draw lines with x=+/- 40
