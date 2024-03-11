let square =
  let counter = ref 0 in
  fun () ->
    let output = !counter * !counter in
    counter := !counter + 1;
    output
