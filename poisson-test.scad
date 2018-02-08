
points = [
	[0, -0.1],
	[0.0, 0.04040862656072645],
	[0.0, 0.04040862656072645],
	[0.0, 0.19324631101021567],
	[0.05555555555555555, 0.19324631101021567],
	[0.05555555555555555, 0.4756526674233825],
	[0.1111111111111111, 0.4756526674233825],
	[0.1111111111111111, 0.7919977298524404],
	[0.16666666666666666, 0.7919977298524404],
	[0.16666666666666666, 0.9999432463110102],
	[0.2222222222222222, 0.9999432463110102],
	[0.2222222222222222, 1.0],
	[0.2777777777777778, 1.0],
	[0.2777777777777778, 0.8245175936435868],
	[0.3333333333333333, 0.8245175936435868],
	[0.3333333333333333, 0.5887060158910329],
	[0.3888888888888889, 0.5887060158910329],
	[0.3888888888888889, 0.3716799091940976],
	[0.4444444444444444, 0.3716799091940976],
	[0.4444444444444444, 0.20675368898978433],
	[0.5, 0.20675368898978433],
	[0.5, 0.10221339387060159],
	[0.5555555555555556, 0.10221339387060159],
	[0.5555555555555556, 0.04772985244040863],
	[0.6111111111111112, 0.04772985244040863],
	[0.6111111111111112, 0.020090805902383654],
	[0.6666666666666666, 0.020090805902383654],
	[0.6666666666666666, 0.007718501702610669],
	[0.7222222222222222, 0.007718501702610669],
	[0.7222222222222222, 0.0030646992054483542],
	[0.7777777777777778, 0.0030646992054483542],
	[0.7777777777777778, 0.0009080590238365494],
	[0.8333333333333334, 0.0009080590238365494],
	[0.8333333333333334, 0.0003972758229284904],
	[0.8888888888888888, 0.0003972758229284904],
	[0.8888888888888888, 0.00028376844494892167],
	[0.9444444444444444, 0.00028376844494892167],
	[0.9444444444444444, 5.675368898978434e-05],
	[1.0, 5.675368898978434e-05],
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
        translate([-0.54, -0.005, -0.1])
            
            // scale this polygon up a bit to make an outer ring of a cookie cutter
            scale([1.17, 1.1, 1.2])
            
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