//TODO wont be able to do verticle lines
if(ds_list_size(global.rooms) < 2) return false;

var rm1 = global.rooms[| 0];
var rm2 = global.rooms[| 1];


var tile1 = rm1[| 0];
var tile2 = rm2[| 0];
var minDist = distance_points(tile1[| 0], tile1[| 1], tile2[| 0], tile2[| 1]);

var r1t, r2t;
for(r1t = 0; r1t < ds_list_size(rm1); r1t++)
    for(r2t = 0; r2t < ds_list_size(rm2); r2t++){
        var t1 = rm1[| r1t];
        var t2 = rm2[| r2t];
        if(distance_points(t1[| 0], t1[| 1], t2[| 0], t2[| 1]) < minDist){
            tile1 = t1;
            tile2 = t2;
            minDist = distance_points(t1[| 0], t1[| 1], t2[| 0], t2[| 1]);
        }
                
    }
    
    
    
var x1 = tile1[| 0], 
x2 = tile2[| 0], 
y1 = tile1[| 1], 
y2 = tile2[| 1];    
  
var dx = x1 - x2;
var dy = y1 - y2;
if(abs(dx) > abs(dy)){
    if(tile1[| 0] < tile2[| 0]){
        x1 = tile1[| 0];
        x2 = tile2[| 0];
        y1 = tile1[| 1];
        y2 = tile2[| 1];
    }else{
        x1 = tile2[| 0];
        x2 = tile1[| 0];
        y1 = tile2[| 1];
        y2 = tile1[| 1];
    }  

    var xx, yy;
    for(xx = x1; xx < x2+1; xx++){
        yy = y1 + dy * (xx - x1) / dx;
        global.level[xx, yy].makeEmpty = true;
    }
    x1++;
    x2++;
    for(xx = x1; xx < x2+1; xx++){
        yy = y1 + dy * (xx - x1) / dx;
        global.level[xx, yy].makeEmpty = true;
    }
}else{
if(tile1[| 1] < tile2[| 1]){
        x1 = tile1[| 0];
        x2 = tile2[| 0];
        y1 = tile1[| 1];
        y2 = tile2[| 1];
    }else{
        x1 = tile2[| 0];
        x2 = tile1[| 0];
        y1 = tile2[| 1];
        y2 = tile1[| 1];
    }  
        
    var xx, yy;
    for(yy = y1; yy < y2+1; yy++){
        xx = x1 + dx * (yy - y1) / dy;
        global.level[xx, yy].makeEmpty = true;
    }
    y1++;
    y2++;
    for(yy = y1; yy < y2+1; yy++){
        xx = x1 + dx * (yy - y1) / dy;
        global.level[xx, yy].makeEmpty = true;
    }
}


//success
return true; 
