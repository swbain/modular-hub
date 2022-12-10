-- grid controller for grid + eurorack

function init()
    g = grid.connect()
    g:led(16, 8, 4)
    g:refresh()
end