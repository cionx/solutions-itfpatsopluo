let enum =
  let state = ref (0, 1) in
  fun () ->
    let a, b = !state in
    state := (b, a + b);
    a
