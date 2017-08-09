var ri, i, row, col;
//delete all rooms as temp way to prevent intersecting rooms
for(ri = 0; ri < ds_list_size(global.rooms); ri++){
    var droom = global.rooms[| ri];
    for(i = 0; i < ds_list_size(droom); i++){ 
        ds_list_destroy(droom[| i]);
    }
    ds_list_destroy(droom);
}
global.rooms = ds_list_clear(global.rooms);


for(row = 0; row < (array_length_2d(global.level, 0)); row++){
    for(col = 0; col < (array_height_2d(global.level)); col++){
        if(global.level[col, row].type != 'empty')continue;    
    
        var inRoom = false;
        for(ri = 0; ri < ds_list_size(global.rooms); ri++){
            var droom = global.rooms[| ri];
            for(i = 0; i < ds_list_size(droom); i++){
                var cell = droom[| i];
                if(cell[| 0] == col && cell[| 1] == row)
                    inRoom = true;
            }       
        }
        if(!inRoom){
            var dsrm = ds_list_create();
            ds_list_add(global.rooms, dsrm);
            recursive_room_find(dsrm, col, row);
            //TODO delete duplicate/overlapping rooms
        }
        
    }
}


