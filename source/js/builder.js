var canvas = new fabric.Canvas('canvas');

Builder = {
  lastLocation: 20,
  current: function(){
  	return canvas.getActiveObject();
  },
	location: function(){
		return (this.lastLocation += 20);
	},
	remove: function(){
		canvas.remove(this.current())
	},
	move: function(where, much){		  
    this.current().animate(where, much, {
		  onChange: canvas.renderAll.bind(canvas),
		  duration: 5,
		  easing: fabric.util.ease.easeOutBounce	
		})
	},
	addPart: function(url){
		fabric.Image.fromURL(url, function(img) {
			var last = Builder.location();
			var top  = url.indexOf('necks') == -1 ? 300 : 0
      canvas.add(img.set({ left: last, top: last + top }));
	  })
	}
}

$(document).keydown(function(e) {
    log(e.which)
    switch(e.which) {
        case 37: // left

          Builder.move('left', "-=1")

          break;

        case 38: // up
        	Builder.move('top', "-=1")
          break;

        case 39: // right
          Builder.move('left', "+=1")
          break;

        case 40: // down
          Builder.move('top', "+=1")
          break;

        case 8: 

          Builder.remove();
          break;

        case 66:
          Builder.current().sendBackwards()
        	break;

        default: return; // exit this handler for other keys
    }

	  e.preventDefault(); // prevent the default action (scroll / move caret)

});

$('img.body').on('click', function(){
	Builder.addPart(this.src)
})

// ----------   EVENTS

canvas.on('object:selected', function(){ 
	$('#settings').show()
});

canvas.on('selection:cleared', function(){ 
	$('#settings').hide()
});

$('#aBack').on('click', function(e){
	Builder.current().sendBackwards();
  e.preventDefault();
})

$('#aFront').on('click', function(e){
	log(e)
	Builder.current().bringForward();
  e.preventDefault();
})

log = function(){
	for(var i = 0 ; i < arguments.length ; i++){
		console.log(arguments[i])
	}
}


// canvas.on('mouse:down', function(options) {
//   if (options.target) {
//     console.log('an object was clicked! ', options.target.type);
//   }
// });

// fabric.Image.fromURL('/img/shapes/music-lander.png', function(img) {

//   canvas.add(img.set({ left: 250, top: 250 }));

//   img.on('moving', function() { positionBtn(img) });
// });

// var bodies = ["music-lander"]
// for(var i = 0 ; i < bodies.length ; i++){
// 	$('#bodies').append("<img src='/img/shapes/" + bodies[i] + ".png'/>")
// }
