# Exercise 10.8.5

> Complete the declaration of `next` such that
> ```ocaml
> let next = · · ·
> let x = next ()
> let y = next () + next () + next ()
> ```
> binds `x` to `2` and `y` to `28`.

---

We can declare the function `next` as follows:
```ocaml
let next =
  let state = ref (0, 2, 28) in
  fun () ->
    let (_, a, b) = !state in
    state := (a, b, 0);
    a
```
