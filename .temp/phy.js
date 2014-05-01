var Engine            = require('famous/core/Engine');
var Surface           = require('famous/core/Surface');
var StateModifier     = require('famous/modifiers/StateModifier');
var EventHandler      = require('famous/core/EventHandler');

var RenderNode        = require('famous/core/RenderNode');
var GridLayout        = require('famous/views/GridLayout');
var Easing            = require('famous/transitions/Easing');
var Timer             = require('famous/utilities/Timer');

var ease = {duration:400, curve: Easing.inOutQuad };

var context = Engine.createContext();

var surfaces = [];
var gridNodes = [];

var grid = new GridLayout({ dimensions:[1,4] });

grid.sequenceFrom(gridNodes);

var animateSurfaces = function(transition,delay){

  transition  = typeof transition !== 'undefined' ? transition  : ease ;
  delay       = typeof delay      !== 'undefined' ? delay       : 200 ;

  for (var i = 0; i < surfaces.length; i++) {

    surface = surfaces[i];

    var animate = function(){

      if (this.visible) {

        this.state.halt();
        this.state.setOpacity(0,ease);

      } else {

        this.state.halt();
        this.state.setOpacity(1,ease);

      }
      this.visible = !this.visible;

    }.bind(surface);

    Timer.setTimeout(animate,delay*i);

  };

}

for (var i = 0; i < 4 ; i++) {

  var surface = new Surface({
    size:[100,100],
    properties: {
      backgroundColor: "hsl(" + (i * 360 / 8) + ", 100%, 50%)",
    }
  })

  surface.state = new StateModifier();

  surface.visible = true;

  node = new RenderNode();
  node.add(surface.state).add(surface);

  surfaces.push(surface);
  gridNodes.push(node);

  surface.on('click',animateSurfaces);

};

context.add(new StateModifier({size:[100,400],origin:[0.5,0.5]})).add(grid);