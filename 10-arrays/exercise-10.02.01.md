# Exercise 10.2.1 (Cloning)

> Declare a function `∀ α. array(α) → array(α)` cloning arrays.
> Make sure your function also works for empty arrays.
> OCaml offers a cloning function as `Array.copy`.

---

We can declare the described function as follows in OCaml:
```ocaml
let clone arr =
  let n = Array.length arr in
  if n = 0 then [||]
  else
    let x = arr.(0) in
    let a = Array.make n x in
    let rec loop i =
      if i >= n then a else (a.(i) <- arr.(i); loop (i + 1))
    in
    loop 1
```
