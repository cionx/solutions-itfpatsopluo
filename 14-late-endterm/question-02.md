# Enumerators 8P

> Declare a function `enum : ∀ α. (int → α) → unit → α` such that each call `enum f` yields a new enumerator for the sequence `f(0), f(1), f(2), ...`

---

We can declare `enum` as follows:
```ocaml
let enum f =
  let counter = ref 0 in
  fun () ->
    let x = !counter in
    counter := !counter + 1;
    f x
```
