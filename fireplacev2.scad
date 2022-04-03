// Fireplace parameteric model V1
// 


/* [Colors (Red, Green, Blue)] */
// Ceiling
Ceil_Color = [0.95,0.95,0.95]; //[0:0.05:1]
ceil_color = Ceil_Color;
// Mantel
Matel_Color = [0.95,0.95,0.95]; //[0:0.05:1]
mantel_color = Matel_Color;
// Tile (right next to firebox)
Tile_Color = [0.75,0.75,0.75]; //[0:0.05:1]
tile_color = Tile_Color;
// Wall
Wall_Color = [0.45,0.45,0.45]; //[0:0.05:1]
wall_color = Wall_Color;
// Picture
Picture_Color = [0.75,0.75,0.75]; //[0:0.05:1]
picture_color = Picture_Color;
// Floor
Floor_Color = [0.45,0.35,0.15]; //[0:0.05:1]
floor_color = Floor_Color;


/* [Firebox Dimensions && Placement] */
// Width of the firebox opening
firebox_w = 36.25;//[0:0.05:40.0]
// Height of the firebox opening
firebox_h = 32.0;//[0:0.1:40.0]
// Depth of firebox (shouldn't really mater in most cases)
firebox_d = 16;//[0:0.05:20.0]
//How far does the firebox sticks out into the room (inch)
from_wall_d = 13; //[0:0.05:16.0]
// Top Clearance for Framing
firebox_top_framing_clearance = 10;
// Hide firebox
firebox_hide = false;


/* [Shelf Overhang && Thickness] ************************/
//Shelf overhang on left and right ends
mantel_shelf_overhang_w = 0.5; //[0:0.25:10.0] 
//Shelf overhang into the room from mantel body
mantel_shelf_overhang_d = 1.5; //[0:0.25:10.0]
//Shelf thickness height
mantel_shelf_h = 1.5;


/* [Mantel Height Adjustments] */
//Mantel visible on top of the tile below the shelf
mantel_top_h = 9;//[0:0.25:192.0]
//Tile visible on top of the firebox
tile_top_h = 6; //[0:0.25:192.0]
//Lift Firebox Up
firebox_lift_height = 3;//[0:0.1:10]

/* [Mantel Width Adjustments] */
//Mantel visible on each side of the tile
mantel_leg_w = 7;//[0:0.25:15.0]
//Tile visible on each side of the firebox
tile_leg_w = 5; //[0:0.25:20.0]

/* [Thickness && Side Material] */
// Thickness of the tile
tile_depth = 0.15;
//Tile Sides - tiles the sides
tile_sides = false;
//Thickness of the material
mantel_front_d = .5;


/* [Fireplace Bump Out] */
//Show the mantel bump out
show_above_mantel = true;
//Above fireplace (inch)
above_fireplace_depth = 5;//[0:0.1:10.0]
above_fireplace_width_inset = 0;//[-10.0:0.01:10.0]

/* [Room] */
//Show Wall
show_wall = true;
//Height of ceiling (inch)
ceiling_height = 96; //[36:0.5:192]
// Show ceiling
show_ceil = false;
//Width of the wall (feet)
wall_width_feet = 21; // [0:0.25:50]
//Show Floor
show_floor = false;
//Floor depth from wall (feet)
floor_depth_feet = 21; // [0:0.25:50]

//Show Windows
show_windows = true;
//Distance between windows
window_distance = 85.5; //[0:0.5:192]
//Windows width, height
window_dimensions = [42.5, 60];
//Window height above floor
window_above_floor = 24; //[0:0.5:192]

/* [Picture] */
//Show Picture over mantel
show_picture = true;
//Picture Width,Height,Depth 
picture_dim = [43, 37, 3];
//Picture Height above floor
picture_z = 56; //[0:0.5:192]
// Picture Color (R,G,B)
//Picture_Color = [0.75,0.75,0.75]; //[0:0.05:1]
//picture_color = Picture_Color;

/* [Show Frame] */
show_frame = false;
//frame_dim = ["2x4","2x6"];

/* [Show Dimensions] */
// Show Dimensions (inch)
show_dims = true;

// *********************************************************************

// Firebox
    if (!firebox_hide) {
        color("black")
        translate([0, -from_wall_d, firebox_lift_height]) 
        cube([firebox_w,firebox_d,firebox_h], false);
    }

//Under Firebox
    uf_w = firebox_w + (tile_leg_w * 2); 
    uf_d = tile_depth;
    uf_h = firebox_lift_height;

    uf_x = -tile_leg_w;
    uf_y = -tile_depth - from_wall_d;

    color(tile_color)
    translate([uf_x, uf_y])
    cube([uf_w,uf_d,uf_h], false);

// Tile Top
    tt_w = (2 * tile_leg_w) + firebox_w;
    tt_d = tile_depth;
    tt_h = tile_top_h;

    tt_x = -tile_leg_w;
    tt_y =  -tile_depth - from_wall_d;
    tt_z = firebox_lift_height + firebox_h;

    if (!show_frame) {
        color(tile_color)
        translate([tt_x, tt_y, tt_z]) 
        cube([tt_w,,tt_d, tt_h], false);
    }

// Tile Legs (tile next to firebox horizontal sides)
    tl_w = tile_leg_w;
    tl_d = tile_depth;
    tl_h = firebox_h;

    tl_l_x = -tl_w;
    tl_y = -tile_depth - from_wall_d;
    tl_z = firebox_lift_height;
    
    tl_r_x = firebox_w;

    if (!show_frame) {
        color(tile_color)
        translate([tl_l_x, tl_y, tl_z]) 
        cube([tl_w,tl_d, tl_h], false);
    
        color(tile_color)
        translate([tl_r_x, tl_y, tl_z]) 
        cube([tl_w,tl_d, tl_h], false);
    }
    
// Mantel Shelf
    shelf_w = (2 * tile_leg_w) + firebox_w + (2 * mantel_leg_w) + (2 * mantel_shelf_overhang_w);
    shelf_d = mantel_shelf_overhang_d + mantel_front_d + from_wall_d;
    shelf_h = mantel_shelf_h;

    shelf_x = -tile_leg_w - mantel_leg_w - mantel_shelf_overhang_w;
    shelf_y = -shelf_d;
    shelf_z = firebox_h + tile_top_h + mantel_top_h + firebox_lift_height;

    if (!show_frame) {
        color(mantel_color)
        translate([shelf_x, shelf_y, shelf_z]) 
        cube([shelf_w, shelf_d, shelf_h], false);
    }

// Mantel Top (wood or other material under shelf)
    mt_w = (2 * tile_leg_w) + firebox_w + (2 * mantel_leg_w);
    mt_d = mantel_front_d;
    mt_h = mantel_top_h;

    mt_x = -tile_leg_w - mantel_leg_w;
    mt_y = -mantel_front_d - from_wall_d;
    mt_z = firebox_h + tile_top_h + firebox_lift_height;

    if (!show_frame) {
        color(mantel_color)
        translate([mt_x, mt_y, mt_z]) 
        cube([mt_w,mt_d, mt_h], false);
    }
    
// Mantel Legs (wood or other material on horizontal outside of  tile and firebox)
    m_w = mantel_leg_w;
    m_d = mantel_front_d;
    m_h = firebox_h + tile_top_h + firebox_lift_height;

    m_l_x = -tile_leg_w - mantel_leg_w;
    m_y = -mantel_front_d - from_wall_d;
    
    m_r_x = firebox_w + tile_leg_w;

    if (!show_frame) {
        color(mantel_color)
        translate([m_l_x, m_y]) 
        cube([m_w, m_d, m_h], false);

        color(mantel_color)
        translate([m_r_x, m_y]) 
        cube([m_w, m_d, m_h], false);
    }

// Mantel Returns Top
    returnt_w = mantel_front_d;
    returnt_d = from_wall_d;
    returnt_h = mantel_top_h;

    returnt_l_x = -tile_leg_w - mantel_leg_w;
    returnt_y = - from_wall_d;
    returnt_z = firebox_h + tile_top_h + firebox_lift_height;
    
    returnt_r_x = firebox_w + tile_leg_w + mantel_leg_w - mantel_front_d;

    if (!show_frame) {
        color(mantel_color)
        translate([returnt_l_x, returnt_y, returnt_z]) 
        cube([returnt_w,returnt_d, returnt_h], false);

        color(mantel_color)
        translate([returnt_r_x, returnt_y, returnt_z]) 
        cube([returnt_w,returnt_d, returnt_h], false);
    }

// Mantel Returns Bottom
    // test ? TrueValue : FlaseValue
    returnb_color = tile_sides ? tile_color : mantel_color ;

    returnb_w = mantel_front_d;
    returnb_d = from_wall_d;
    returnb_h = firebox_h + tile_top_h + firebox_lift_height;

    returnb_l_x = -tile_leg_w - mantel_leg_w;
    returnb_y = - from_wall_d;
    
    returnb_r_x = firebox_w + tile_leg_w + mantel_leg_w - mantel_front_d;

    if (!show_frame) {
        color(returnb_color)
        translate([returnb_l_x, returnb_y]) 
        cube([returnb_w,returnb_d, returnb_h], false);

        color(returnb_color)
        translate([returnb_r_x, returnb_y]) 
        cube([returnb_w,returnb_d, returnb_h], false);
    }

// Above Mantel
    above_w = firebox_w + (2 * tile_leg_w) + (2 * mantel_leg_w) - (above_fireplace_width_inset * 2);
    above_d = above_fireplace_depth;
    above_h = ceiling_height;

    above_x = (firebox_w/2) - (above_w/2);
    above_y = -above_d;
    above_z = 0.01;
    
    cutout_w = above_w * 0.9;
    cutout_d = above_fireplace_depth * 1.1;
    cutout_h = returnb_h;
    
    cutout_x = (firebox_w/2) - (cutout_w/2);
    cutout_y = -above_d - 0.001;
    cutout_z = 0;
    
    if (show_above_mantel && !show_frame) {
        color("gray")
        
     difference() {
        translate([above_x, above_y, above_z]) 
        cube([above_w, above_d, above_h], false);
        translate([cutout_x, cutout_y, cutout_z]) 
        cube([cutout_w,cutout_d,cutout_h],false);
     }
    }

// Frame
    if (show_frame) {
    // Legs floor
    frame_leg_floor_w = tile_leg_w + mantel_leg_w - mantel_front_d;
    frame_leg_floor_d = 3.5;
    frame_leg_floor_h = 1.5;
    
    frame_leg_floor_l_x = -tile_leg_w - mantel_leg_w + mantel_front_d;
    frame_leg_floor_r_x = firebox_w;
    
    frame_leg_floor_y = - from_wall_d;
    frame_leg_floor_z = 0;

        color("orange")
        translate([frame_leg_floor_l_x, frame_leg_floor_y, frame_leg_floor_z]) 
        cube([frame_leg_floor_w, frame_leg_floor_d, frame_leg_floor_h], false);

        color("orange")
        translate([frame_leg_floor_r_x, frame_leg_floor_y, frame_leg_floor_z]) 
        cube([frame_leg_floor_w, frame_leg_floor_d, frame_leg_floor_h], false);
    
    // Under Shelf
    frame_under_shelf_w = (2* tile_leg_w) + (2 * mantel_leg_w) + firebox_w - (2 * mantel_front_d);
    frame_under_shelf_d = 3.5;
    frame_under_shelf_h = 1.5;
    
    frame_under_shelf_x = -tile_leg_w - mantel_leg_w + mantel_front_d;
    frame_under_shelf_y = - from_wall_d;
    frame_under_shelf_z = firebox_h + tile_top_h + mantel_top_h + firebox_lift_height - frame_under_shelf_h;
 
        color("orange")
        translate([frame_under_shelf_x, frame_under_shelf_y, frame_under_shelf_z]) 
        cube([frame_under_shelf_w, frame_under_shelf_d, frame_under_shelf_h], false);
        
        
    // Top with clearance
    //firebox_top_framing_clearance
    frame_above_firebox_w = (2* tile_leg_w) + (2 * mantel_leg_w) + firebox_w - (2 * mantel_front_d) - (2 * 1.5);
    frame_above_firebox_d = 3.5;
    frame_above_firebox_h = 1.5;
    
    frame_above_firebox_x = -tile_leg_w - mantel_leg_w + mantel_front_d + 1.5;
    frame_above_firebox_y = - from_wall_d;
    frame_above_firebox_z = firebox_h + firebox_lift_height + firebox_top_framing_clearance;
 
        color("orange")
        translate([frame_above_firebox_x, frame_above_firebox_y, frame_above_firebox_z]) 
        cube([frame_above_firebox_w, frame_above_firebox_d, frame_above_firebox_h], false);
       
    // Outside Leg
    frame_leg_outside_w = 1.5;
    frame_leg_outside_d = 3.5;
    frame_leg_outside_h = firebox_h + tile_top_h + mantel_top_h + firebox_lift_height - frame_under_shelf_h - 1.5;
    
    frame_leg_outside_l_x = -tile_leg_w - mantel_leg_w + mantel_front_d;
    frame_leg_outside_r_x = firebox_w + tile_leg_w + mantel_leg_w - mantel_front_d - 1.5;
    
    frame_leg_outside_y = - from_wall_d;
    frame_leg_outside_z = 1.5;

        color("orange")
        translate([frame_leg_outside_l_x, frame_leg_outside_y, frame_leg_outside_z]) 
        cube([frame_leg_outside_w, frame_leg_outside_d, frame_leg_outside_h], false);

        color("orange")
        translate([frame_leg_outside_r_x, frame_leg_outside_y, frame_leg_outside_z]) 
        cube([frame_leg_outside_w, frame_leg_outside_d, frame_leg_outside_h], false);
        
    // Inside Leg
    frame_leg_inside_w = 1.5;
    frame_leg_inside_d = 3.5;
    frame_leg_inside_h = firebox_h + firebox_lift_height + firebox_top_framing_clearance - 1.5;
    
    frame_leg_inside_l_x = -1.5;
    frame_leg_inside_r_x = firebox_w;
    
    frame_leg_inside_y = - from_wall_d;
    frame_leg_inside_z = 1.5;

        color("orange")
        translate([frame_leg_inside_l_x, frame_leg_inside_y, frame_leg_inside_z]) 
        cube([frame_leg_inside_w, frame_leg_inside_d, frame_leg_inside_h], false);

        color("orange")
        translate([frame_leg_inside_r_x, frame_leg_inside_y, frame_leg_inside_z]) 
        cube([frame_leg_inside_w, frame_leg_inside_d, frame_leg_inside_h], false);
        
    // Legs Floor Return
    
    above_frame_y = show_above_mantel ? -above_fireplace_depth : 0;
    
    frame_leg_f_return_w = 3.5;
    frame_leg_f_return_d = (from_wall_d - 3.5 + above_frame_y) ;
    frame_leg_f_return_h = 1.5;
    
    frame_leg_f_return_l_x = -tile_leg_w - mantel_leg_w + mantel_front_d;
    frame_leg_f_return_r_x = firebox_w + tile_leg_w + mantel_leg_w - mantel_front_d - 3.5;
    
    frame_leg_f_return_y = -from_wall_d + 3.5;
    frame_leg_f_return_z = 0;

        color("orange")
        translate([frame_leg_f_return_l_x, frame_leg_f_return_y, frame_leg_f_return_z]) 
        cube([frame_leg_f_return_w, frame_leg_f_return_d, frame_leg_f_return_h], false);

        color("orange")
        translate([frame_leg_f_return_r_x, frame_leg_f_return_y, frame_leg_f_return_z]) 
        cube([frame_leg_f_return_w, frame_leg_f_return_d, frame_leg_f_return_h], false);
    
    // Outside Leg Wall
    frame_leg_outside_wall_w = 1.5;
    frame_leg_outside_wall_d = 3.5;
    frame_leg_outside_wall_h = firebox_h + tile_top_h + mantel_top_h + firebox_lift_height - frame_under_shelf_h - 1.5;
    
    frame_leg_outside_wall_l_x = -tile_leg_w - mantel_leg_w + mantel_front_d;
    frame_leg_outside_wall_r_x = firebox_w + tile_leg_w + mantel_leg_w - mantel_front_d - 1.5;
    
    frame_leg_outside_wall_y = above_frame_y - 3.5;
    frame_leg_outside_wall_z = 1.5;

        color("green")
        translate([frame_leg_outside_wall_l_x, frame_leg_outside_wall_y, frame_leg_outside_wall_z]) 
        cube([frame_leg_outside_wall_w, frame_leg_outside_wall_d, frame_leg_outside_wall_h], false);

        color("green")
        translate([frame_leg_outside_wall_r_x, frame_leg_outside_wall_y, frame_leg_outside_wall_z]) 
        cube([frame_leg_outside_wall_w, frame_leg_outside_wall_d, frame_leg_outside_wall_h], false);
 
    // Under Shelf Wall    
    frame_under_shelf_wall_x = -tile_leg_w - mantel_leg_w + mantel_front_d;
    frame_under_shelf_wall_y = above_frame_y - 3.5;
    frame_under_shelf_wall_z = firebox_h + tile_top_h + mantel_top_h + firebox_lift_height - frame_under_shelf_h;
 
        color("blue")
        translate([frame_under_shelf_wall_x, frame_under_shelf_wall_y, frame_under_shelf_wall_z]) 
        cube([frame_under_shelf_w, frame_under_shelf_d, frame_under_shelf_h], false);
        
        
    // Wall Bump Out Corners Framing
    frame_wall_vert_w = 1.5;
    frame_wall_vert_d = 3.5;
    frame_wall_vert_h = ceiling_height - (2 * 1.5);
    
    frame_wall_vert_lc_x = 0.5 -(firebox_w + (2 * tile_leg_w) + (2 * mantel_leg_w) - (above_fireplace_width_inset * 2))/2 + (firebox_w/2);
    frame_wall_vert_rc_x = (firebox_w + (2 * tile_leg_w) + (2 * mantel_leg_w) - (above_fireplace_width_inset * 2))/2 + (firebox_w/2) - 0.5 - 1.5;
    frame_wall_vert_y = -3.5;
    frame_wall_vert_z = 1.5;
    
        color("red")
        translate([frame_wall_vert_lc_x, frame_wall_vert_y, frame_wall_vert_z]) 
        cube([frame_wall_vert_w, frame_wall_vert_d, frame_wall_vert_h], false);
        
        color("red")
        translate([frame_wall_vert_rc_x, frame_wall_vert_y, frame_wall_vert_z]) 
        cube([frame_wall_vert_w, frame_wall_vert_d, frame_wall_vert_h], false);
    }



// Windows
if (show_windows) {
    window_w = window_dimensions[0];
    window_d = 10;
    window_h = window_dimensions[1];
    // Left Window
    window_l_x = 0 + (firebox_w/2) - window_w - (window_distance/2);
    window_y = -0.75;
    window_z = window_above_floor;
    translate([window_l_x, window_y, window_z]) 
    cube([window_w, window_d, window_h], false);
    // Right Window
    window_r_x = (window_distance/2) + (firebox_w/2);
    translate([window_r_x, window_y, window_z]) 
    cube([window_w, window_d, window_h], false);
}

// Wall
if (show_wall) {
    wall_w = wall_width_feet*12;
    wall_d = 4;
    wall_h = ceiling_height;
    
    wall_x = -wall_w/2 + (firebox_w/2);
    color(wall_color)
    translate([wall_x, 0, 0.01]) 
    cube([wall_w, wall_d, wall_h], false);
}

if (show_floor) {
    floor_w = wall_width_feet*12;
    floor_d = floor_depth_feet*12;
    floor_h = 1;
    
    floor_x = -(wall_width_feet*12)/2 + (firebox_w/2);
    floor_y = -floor_d;
    color(floor_color)
    translate([floor_x, floor_y, -floor_h]) 
    cube([floor_w, floor_d, floor_h], false);
}

if (show_ceil) {
    ceil_w = wall_width_feet*12;
    ceil_d = floor_depth_feet*12;
    ceil_h = 1;
    
    ceil_x = -(wall_width_feet*12)/2 + (firebox_w/2);
    ceil_y = -ceil_d;
    ceil_z  = ceiling_height;
    color(ceil_color)
    translate([ceil_x, ceil_y, ceil_z]) 
    cube([ceil_w, ceil_d, ceil_h], false);
}

// Picture
if (show_picture) {
    // If the above mantel bump-out is enabled
    above_y = show_above_mantel ? -above_fireplace_depth : 0;
    
    pic_w = picture_dim[0];
    pic_d = 3;
    pic_h = picture_dim[1];

    pic_x = firebox_w/2 - pic_w/2;
    pic_y = above_y - pic_d;
    pic_z = picture_z;

    color(picture_color)
    translate([pic_x, pic_y, pic_z]) 
    cube([pic_w, pic_d, pic_h], false);
}



// -----------------------------------------------------------------
// Shelf Width Dimension

if (show_dims) {
    // Shelf Width
    dim_x = firebox_w + tile_leg_w + mantel_leg_w;
    dim_y = shelf_y - mantel_front_d - 5;
    
    mantel_wshelf_dim_str = str("Shelf Width ",str(shelf_w));
    
    color("red")
    translate([dim_x, dim_y, shelf_z])
    rotate([90])
    text(str(mantel_wshelf_dim_str), size= 5, halign = "left");

    // Shelf depth
    above_d = show_above_mantel ? above_fireplace_depth : 0;
    shelf_depth = shelf_d - above_d;
    
    mantel_shelf_depth_dim_str = str("Shelf Depth ",str(shelf_depth));
    
    color("red")
    translate([dim_x, dim_y, shelf_z + 6])
    rotate([90])
    text(mantel_shelf_depth_dim_str, size=5, halign = "left");

    // Front Width Dimension
    front_w = firebox_w + (2 * tile_leg_w) + (2 * mantel_leg_w);
    
    mantel_wfront_dim_str = str("Front Width ",str(shelf_w));
    
    color("red")
    translate([dim_x, dim_y, 0])
    rotate([90])
    text(mantel_wfront_dim_str, size=5, halign = "left");

    // Heigth Dimension
    mantel_h = shelf_z + mantel_shelf_h;
    
    mantel_h_dim_str = str("Height ",str(mantel_h));
    
    color("red")
    translate([dim_x , dim_y, mantel_h/2])
    rotate([90])
    text(mantel_h_dim_str, size=5, halign = "left");
    
    // Side Dimensions
    above_y = show_above_mantel ? above_fireplace_depth : 0;
    mantel_d_side = above_fireplace_width_inset < 0 ? mantel_front_d + from_wall_d - above_y : mantel_front_d + from_wall_d;
    
    mantel_d_side_dim_str = str("Side Depth ",str(mantel_d_side));
    
    color("red")
    translate([dim_x , dim_y, (mantel_h/2) - 6])
    rotate([90])
    text(mantel_d_side_dim_str, size=5, halign = "left");

}



