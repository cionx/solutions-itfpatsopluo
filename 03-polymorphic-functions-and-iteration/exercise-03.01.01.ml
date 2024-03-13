let id x = x
let first x y = x
let curry f x y = f (x, y)
let uncurry f (x, y) = f x y
let rec loop x = loop x
