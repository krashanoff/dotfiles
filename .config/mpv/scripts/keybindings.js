//
// keybindings
//

// <C-f> for fullscreen
mp.add_key_binding("ctrl+f", () => {
  mp.set_property("fullscren", mp.get_property("fullscreen") == "yes" ? "no" : "yes")
});
