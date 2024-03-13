let enum f =
  let counter = ref 0 in
  fun () ->
    let x = !counter in
    counter := !counter + 1;
    f x
