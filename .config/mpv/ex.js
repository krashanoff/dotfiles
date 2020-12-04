/* TODO
 * - Simple sub-track change.
 */

// If in fullscreen, toggle to windowed on pause,
// then toggle back.
function on_pause_change(name, val) {
    mp.unobserve_property("pause");
    if (val === true) {
	mp.set_property("fullscreen", "no");
	mp.observe_property("pause", "bool", (_, v) => {
	    mp.unobserve_property("pause");
	    mp.set_property("fullscreen", "yes");
	    mp.observe_property("pause", "bool", on_pause_change);
	});
    }
}

mp.observe_property("pause", "bool", on_pause_change);
