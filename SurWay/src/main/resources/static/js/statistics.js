


//array of suitable colors
var colors = ["#E74C3C", "#6C3483", "#3498DB", "#F1C40F", "#1E8449", "#E67E22", "#5D6D7E"]

/**
 * Function to draw a pichart. 
 * @author vijaicv
 * @param {String} canvasId  canvas on which to draw the pichart
 * @param {String} legendId  div in which legend for pichart is rendered
 * @param {Map} cordMap      map(max size 7) of values and thier corresponding perscentage(double) i.e 0.2 for 20%
 */
function drawPiChart(canvasId, legendId, cordMap) {

    //get html dom elements
    var canvas = document.getElementById(canvasId)
    var legend = document.getElementById(legendId)
    var ctx = canvas.getContext("2d");


    //start vertically
    var currentAngle = -90

    //locate center of canvas
    var center = {
        x: canvas.width / 2,
        y: canvas.height / 2
    }

    
    var legendBox = document.createDocumentFragment();
    //create a div dynamically
    var newEntry = document.createElement("div")


    //for each element in map
    index = 0
    for (var [key, value] of cordMap) {
        //draw the segment
        ctx.beginPath();
        ctx.fillStyle = colors[index];
        ctx.arc(center.x, center.y, (canvas.width / 2) - 40, currentAngle, currentAngle + value * 2 * Math.PI);
        ctx.lineTo(center.x, center.y)
        currentAngle = currentAngle + value * 2 * Math.PI
        ctx.fill();

        //create an element to add to legend for each entry in cordMap
        var legendColor = document.createElement("div")
        var legendName = document.createElement("div")

        //apply styling from stylesheet
        legendColor.setAttribute("class", "legendColor")
        legendColor.setAttribute("style", "background-color:" + colors[index])

        legendName.setAttribute("class", "legendName")
        legendName.append(key)

        newEntry.appendChild(legendColor)
        newEntry.appendChild(legendName)
        newEntry.setAttribute("class", "newLegendEntry")
        newEntry.setAttribute("style", "width:" + canvas.width + "px")
        legendBox.appendChild(newEntry)

        index = index + 1
    }

    //add legend div to the dom
    legend.appendChild(legendBox)
}





function drawGraph(canvasId, cordMap){
     //get html dom elements
     var canvas = document.getElementById(canvasId)
     var ctx = canvas.getContext("2d");


     var maxX=60
     var maxY=100
     var xIncrement = 10
     var yIncrement =10

     var xUnitSize = (canvas.width-80)/(maxX/xIncrement)
     var yUnitSize = (canvas.height-80)/(maxY/yIncrement)

     //set origin
     var origin = {
         x:40,
         y:canvas.height-40
     }

     
     //draw axes 
     ctx.beginPath()
     ctx.strokeStyle="3px black"
     ctx.fillStyle="black"
     ctx.moveTo(origin.x,origin.y)
     ctx.lineTo(canvas.width-40,canvas.height-40)
     ctx.stroke()
    

     ctx.beginPath()
     ctx.moveTo(origin.x,origin.y)
     ctx.strokeStyle="black"
     ctx.fillStyle="black"
     ctx.lineTo(40,40)
     ctx.stroke()

     
     for(var x=0;(x*xIncrement)<=maxX;x++){
        ctx.beginPath()
        ctx.arc(origin.x+xUnitSize*x,origin.y,2,0,2*Math.PI)
        ctx.strokeText(x*xIncrement,origin.x+xUnitSize*x,origin.y+20)
        ctx.fill()
     }

     
     for(var y=0;(y*yIncrement)<=maxY;y++){
        ctx.beginPath()
        ctx.arc(origin.x,origin.y-y*yUnitSize,2,0,2*Math.PI)
        ctx.strokeText(y*yIncrement,origin.x-20,origin.y-yUnitSize*y)
        ctx.fill()
     }


     ctx.moveTo(origin.x,origin.y)
     console.log(origin.x+key,origin.y-Math.floor(value/maxY))
     //draw graph
     var index = 0
     for(var [key,value] of cordMap){
        ctx.fillStyle=colors[index]
        ctx.fillRect(origin.x+((key/xIncrement)*xUnitSize),origin.y-((value/yIncrement)*yUnitSize),xUnitSize,((value/yIncrement)*yUnitSize))
        index=index+1
     }
     ctx.strokeStyle="red"
     ctx.stroke()
}






