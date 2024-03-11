let enum_reset () =
  let counter = ref 0 in
  let enum () = counter := !counter + 1; !counter in
  let reset () = counter := 0 in
  (enum, reset)
