
points = [
	[0, -0.1],
	[0.0, 0.5033072760072159],
	[0.0, 0.5033072760072159],
	[0.0, 1.0],
	[0.5, 1.0],
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