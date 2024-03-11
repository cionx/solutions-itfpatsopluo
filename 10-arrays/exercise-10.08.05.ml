let next =
  let state = ref (0, 2, 28) in
  fun () ->
    let (_, a, b) = !state in
    state := (a, b, 0);
    a

let x = next ()
let y = next () + next () + next ()
