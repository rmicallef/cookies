
points = [
	[0.0, 0.08764150246784269],
	[0.029411764705882353, 0.12522205086106414],
	[0.058823529411764705, 0.17508930896747815],
	[0.08823529411764705, 0.23957762943438046],
	[0.11764705882352941, 0.32080469554883195],
	[0.14705882352941177, 0.42038091158417046],
	[0.1764705882352941, 0.5390798231011418],
	[0.20588235294117646, 0.6765049599186366],
	[0.23529411764705882, 0.8308004272859445],
	[0.2647058823529412, 0.9984590452299783],
	[0.29411764705882354, 1.17427987640833],
	[0.3235294117647059, 1.3515147802114251],
	[0.3529411764705882, 1.5222213149908108],
	[0.38235294117647056, 1.677809374190975],
	[0.4117647058823529, 1.809736111919526],
	[0.4411764705882353, 1.9102741849270513],
	[0.47058823529411764, 1.9732584866391882],
	[0.5, 1.9947114020071635],
	[0.5294117647058824, 1.9732584866391882],
	[0.5588235294117647, 1.9102741849270513],
	[0.5882352941176471, 1.809736111919526],
	[0.6176470588235294, 1.677809374190975],
	[0.6470588235294118, 1.5222213149908108],
	[0.6764705882352942, 1.351514780211425],
	[0.7058823529411764, 1.1742798764083306],
	[0.7352941176470588, 0.9984590452299787],
	[0.7647058823529411, 0.8308004272859449],
	[0.7941176470588235, 0.6765049599186368],
	[0.8235294117647058, 0.5390798231011421],
	[0.8529411764705882, 0.42038091158417046],
	[0.8823529411764706, 0.32080469554883195],
	[0.9117647058823529, 0.23957762943438046],
	[0.9411764705882353, 0.17508930896747815],
	[0.9705882352941176, 0.12522205086106414],
	[1.0, 0.08764150246784269],
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