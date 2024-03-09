let rec init_aux n f acc =
  if n < 0 then acc
  else init_aux (n - 1) f (f n :: acc)

let init n f =
  init_aux n f []



let init' m n f =
  List.init n (fun k -> f (m + k))

let init'' m n f =
  init' m (n - m + 1) f
