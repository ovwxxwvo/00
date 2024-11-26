## ueber-server.yazi

- Preview image based on tmux in linux, whatever wayland | xorg .
- Set a key then you can toggle on|off to start|stop ueberzug for preview image.

---
### Installation

```sh
ya pack -a ovwxxwvo/ueber-server.yazi
```


---
### Usage

In your yazi keymap toml config file,
```sh
~/.config/yazi/keymap.toml
```

Set your key.
``` toml
[manager]
  keymap = [
  # preview
    { on = ["t","u"], run = "plugin" ,desc="toggle ueberzug" },
    ]
```

---
### License

This plugin is MIT-licensed. For more information check the [LICENSE](LICENSE) file.


