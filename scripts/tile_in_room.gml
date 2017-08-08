var dsroom = argument0;
var tilex = argument1;
var tiley = argument2;


if(!ds_exists(dsroom, ds_type_list)) return false;

for(i = 0; i < ds_list_size(dsroom); i++){
    var cell = dsroom[| i];
    if(!ds_exists(cell, ds_type_list)) continue;

    if(cell[| 0] == tilex && cell[| 1] == tiley) return true;
}
return false;
