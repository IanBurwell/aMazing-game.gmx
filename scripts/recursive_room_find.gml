var ds_room = argument0;
var xx = argument1;
var yy = argument2;

var tile = ds_list_create();
tile[| 0] = xx;
tile[| 1] = yy;

ds_list_add(ds_room, tile);

var options = 0;
if(xx < array_height_2d(global.level)-1 && global.level[xx+1, yy].type == 'empty')options++;
if(xx > 0 && global.level[xx-1, yy].type == 'empty')options++;
if(yy < array_length_2d(global.level, 0)-1 && global.level[xx, yy+1].type == 'empty')options++;
if(yy > 0 && global.level[xx, yy-1].type == 'empty')options++;

if(options == 0) return true;
else{
    var a,b,c,d;
    a = true;
    b = true;
    c = true;
    d = true;
    
    if(xx < array_height_2d(global.level)-1 && !tile_in_room(ds_room, xx+1, yy) && global.level[xx+1, yy].type == 'empty')
        a = recursive_room_find(ds_room, xx+1, yy);
    if(xx > 0 && !tile_in_room(ds_room, xx-1, yy) && global.level[xx-1, yy].type == 'empty')
        b = recursive_room_find(ds_room, xx-1, yy);
    if(yy < array_length_2d(global.level, 0)-1 && !tile_in_room(ds_room, xx, yy+1) && global.level[xx, yy+1].type == 'empty')
        c = recursive_room_find(ds_room, xx, yy+1);
    if(yy > 0 && !tile_in_room(ds_room, xx, yy-1) && global.level[xx, yy-1].type == 'empty')
        d = recursive_room_find(ds_room, xx, yy-1);
    return a && b && c && d;
}
