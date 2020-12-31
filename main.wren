import "graphics" for Canvas
import "dome" for Window
import "input" for Keyboard

import "nokia" for Display, Palette, Font, Sound, FPS, Keymap

class Square {
  static x {
    if (!__x) {
      __x = 0
    }
    return __x
  }

  static y {
    if (!__y) {
      __y = 20
    }
    return __y
  }

  static update() {
    __x = x % Display.default.width + 1

    if (Keyboard.isKeyDown(Keymap.up)) {
      if (__y + 4 < Display.default.height) {
        __y = __y + 1
      } else {
        Sound.play("blip1")
      }
    }

    if (Keyboard.isKeyDown(Keymap.down)) {
      if (__y - 1 > 0) {
        __y = __y - 1
      } else {
        Sound.play("blip2")
      }
    }
  }

  static draw() {
    Canvas.rectfill(x, y, 3, 3, Palette.black)
  }
}

class Game {

  static init() {
    Display.init()
    Window.title = "Hello Nokia"
    Sound.play("jingle1")
    Font.darkmode()
  }

  static update() {
    if (FPS.canUpdate()) {
      nokiaUpdate()
    }
  }

  static nokiaUpdate() {
    Square.update()
  }

  static draw(dt) {
    Canvas.cls(Palette.white)
    Font.gizmo.print("HELLO NOKIA", 15, 5)
    Square.draw()
  }
}
