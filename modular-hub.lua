-- grid controller for grid + eurorack
--
-- crow out 1: to morphagene record in. bottom right corner button triggers recording

g = grid.connect()
g.key = function (x,y,z)
    if x == 16 and y == 8 and z == 1 then
        toggle_recording()
    end

    grid_refresh()
end

is_recording = false

function init()
    grid_refresh()
    crow.output[1].action = "pulse(0.1,5,1)"
end

function grid_refresh()
    if is_recording then
        g:led(16,8,15)
    else
        g:led(16,8,4)
    end

    g:led(16,6,4)
    g:led(15,6,4)
    g:led(13,6,4)
    g:led(12,6,4)
    for i=12,16 do 
        if i ~= 14 then
            g:led(i, 6, 4)
        end
    end
    g:refresh()
end

function toggle_recording()
    is_recording = not is_recording
    crow.output[1]()
end
