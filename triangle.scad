
points = [
	[0, -0.1],
	[0.0028411864674448765, 0.07736250968241673],
	[0.0028411864674448765, 0.07736250968241673],
	[0.0028411864674448765, 0.2019752130131681],
	[0.05532322928494777, 0.2019752130131681],
	[0.05532322928494777, 0.3445972114639814],
	[0.10780527210245067, 0.3445972114639814],
	[0.10780527210245067, 0.47347017815646786],
	[0.16028731491995357, 0.47347017815646786],
	[0.16028731491995357, 0.6012780790085205],
	[0.21276935773745645, 0.6012780790085205],
	[0.21276935773745645, 0.7317002323780015],
	[0.2652514005549594, 0.7317002323780015],
	[0.2652514005549594, 0.857571649883811],
	[0.3177334433724623, 0.857571649883811],
	[0.3177334433724623, 1.0],
	[0.37021548618996514, 1.0],
	[0.37021548618996514, 0.929124709527498],
	[0.42269752900746804, 0.929124709527498],
	[0.42269752900746804, 0.8518590240123934],
	[0.47517957182497095, 0.8518590240123934],
	[0.47517957182497095, 0.7455460883036406],
	[0.527661614642474, 0.7455460883036406],
	[0.527661614642474, 0.6684740511231604],
	[0.5801436574599768, 0.6684740511231604],
	[0.5801436574599768, 0.5731990704879938],
	[0.6326257002774797, 0.5731990704879938],
	[0.6326257002774797, 0.4941905499612703],
	[0.6851077430949826, 0.4941905499612703],
	[0.6851077430949826, 0.4048218435321456],
	[0.7375897859124855, 0.4048218435321456],
	[0.7375897859124855, 0.3157436096049574],
	[0.7900718287299884, 0.3157436096049574],
	[0.7900718287299884, 0.22589078233927187],
	[0.8425538715474913, 0.22589078233927187],
	[0.8425538715474913, 0.1367157242447715],
	[0.8950359143649942, 0.1367157242447715],
	[0.8950359143649942, 0.048896204492641364],
	[0.9475179571824971, 0.048896204492641364],
	[1, -0.1],
	[0, -0.1]
];
difference(){
    
// OUTER COOKIE CUTTER SHAPE
    
    // extrude the outer polygon into a 3D shape
    // this extrusion is thinner than the inner shape to make sure the inner shape "cuts" through it completely
    linear_extrude(0.4)
    
        // x- and y-shift the outer polygon to be roughly centered around the inner shape
        // z-shift the outer polygon so the extruded inner shape cuts all the way through
        translate([-0.55, 0, -0.1])
            
            // scale this polygon up a bit to make an outer ring of a cookie cutter
            scale(1.3, 1.2, 1)
            
                // generate a polygon to become the outer shape
                polygon(points);        
    
// INNER COOKIE CUTTER SHAPE TO BE SUBTRACTED FROM OUTER

    // extrude the inner polygon into a 3D shape
    // this extrusion is thicker than the outer shape to ensure the inner shape "cuts" completey through the outer shape
    // the "scale" parameter grows the shape as it extrudes to give the finished cutter a narrower edge
    linear_extrude(0.6) 
    
        // x-shift the shape to 
        translate([-0.5, -0.012, 0]) //x-center the polygon at origin
            
            // generate a polygon to become the inner shape (this is effectively defining a hole)
            polygon(points);
}