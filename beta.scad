
points = [
	[0.0, 0.0],
	[0.029411764705882353, 0.12018089316227756],
	[0.058823529411764705, 0.2359647043753647],
	[0.08823529411764705, 0.3472684546034517],
	[0.11764705882352941, 0.45400413411798274],
	[0.14705882352941177, 0.556078195803149],
	[0.1764705882352941, 0.6533909766316055],
	[0.20588235294117646, 0.7458360340353749],
	[0.23529411764705882, 0.8332993808366767],
	[0.2647058823529412, 0.915658598487987],
	[0.29411764705882354, 0.9927818033161192],
	[0.3235294117647059, 1.0645264338769969],
	[0.3529411764705882, 1.1307378188514692],
	[0.38235294117647056, 1.1912474733574143],
	[0.4117647058823529, 1.245871055976488],
	[0.4411764705882353, 1.2944058975163855],
	[0.47058823529411764, 1.336627983043052],
	[0.5, 1.37228822720381],
	[0.5294117647058824, 1.4011078233891652],
	[0.5588235294117647, 1.4227723604191558],
	[0.5882352941176471, 1.4369242708217176],
	[0.6176470588235294, 1.4431529766361961],
	[0.6470588235294118, 1.4409817874616988],
	[0.6764705882352942, 1.4298501012769098],
	[0.7058823529411764, 1.4090886121405333],
	[0.7352941176470588, 1.377883747957598],
	[0.7647058823529411, 1.3352248410278518],
	[0.7941176470588235, 1.2798222362083098],
	[0.8235294117647058, 1.2099734613497852],
	[0.8529411764705882, 1.1233292406309068],
	[0.8823529411764706, 1.0164460040750365],
	[0.9117647058823529, 0.8838152888636676],
	[0.9411764705882353, 0.715311223066938],
	[0.9705882352941176, 0.4866772027741895],
	[1.0, 0.0],
];
difference(){
    
// OUTER COOKIE CUTTER SHAPE
    
    // extrude the outer polygon into a 3D shape
    // this extrusion is thinner than the inner shape to make sure the inner shape "cuts" through it completely
    linear_extrude(0.4)
    
        // x- and y-shift the outer polygon to be roughly centered around the inner shape
        // z-shift the outer polygon so the extruded inner shape cuts all the way through
        translate([-0.54, -0.03, -0.1])
            
            // scale this polygon up a bit to make an outer ring of a cookie cutter
            scale(1.08, 1.08, 1.08)
            
                // generate a polygon to become the outer shape
                polygon(points);        
    
// INNER COOKIE CUTTER SHAPE TO BE SUBTRACTED FROM OUTER

    // extrude the inner polygon into a 3D shape
    // this extrusion is thicker than the outer shape to ensure the inner shape "cuts" completey through the outer shape
    // the "scale" parameter grows the shape as it extrudes to give the finished cutter a narrower edge
    linear_extrude(0.6, scale=1.08) 
    
        // x-shift the shape to 
        translate([-0.5, -0.012, 0]) //x-center the polygon at origin
            
            // generate a polygon to become the inner shape (this is effectively defining a hole)
            polygon(points);
}