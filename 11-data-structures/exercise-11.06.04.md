# Exercise 11.6.4

> Declare a function that checks whether a linked list in the heap `H` is circular.

---

We employ Floyd’s algorithm.
```ocaml
let cyclic start =
  let next a =
    H.get a 1
  in
  let rec loop slow fast =
    if slow = fast then true
    else if fast = -1 then false
    else
      let fast' = next fast in
      if fast' = -1 then false
      else loop (next slow) (next fast')
  in
  if start = -1 then false else loop start (next start)
```
