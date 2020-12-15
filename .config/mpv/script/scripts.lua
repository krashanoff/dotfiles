--Show the state+filename on pause change.
function display_state(name, value)
    if value then
        mp.command("show-text \"Paused ${filename:}\" 500")
    else
        mp.command("show-text \"Resumed\" 500")
    end
end
mp.observe_property("pause", "bool", display_state)
