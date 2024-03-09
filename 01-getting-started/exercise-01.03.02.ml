let equal x y =
  if x <= y then y <= x else false

let unequal x y =
  if x <= y then (if y <= x then false else true) else true

let less x y =
  if x <= y then (if y <= x then false else true) else false

let less_equal x y =
  x <= y

(** Take the declaration for "less" and swap x and y. *)
let greater x y =
  if y <= x then (if x <= y then false else true) else false

(** Take the declaration for "less_equal" and swap x and y. *)
let greater_equal x y =
  y <= x



let less_equal' x y =
  x - y <= 0
