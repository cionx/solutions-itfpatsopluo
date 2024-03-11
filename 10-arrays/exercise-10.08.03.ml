let fac =
  let state = ref (0, 1) in
  fun () ->
    let (n, f) = !state in
    state := (n + 1, (n + 1) * f);
    f
