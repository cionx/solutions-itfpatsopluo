let newEnum () =
  let counter = ref 0 in
  (fun () -> counter := !counter + 1; !counter)
