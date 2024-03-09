let fac n =
  let rec helper n acc =
    if n = 0 then acc else helper (n - 1) (n * acc)
  in
  helper n 1

let fac n =
  let rec helper n =
    fun acc ->
      if n = 0 then acc else helper (n - 1) (n * acc)
  in
  helper n 1
