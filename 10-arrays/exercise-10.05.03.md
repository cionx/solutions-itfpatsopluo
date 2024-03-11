# Exercise 10.5.3

> Declare a variant of selection sort swapping the greatest element to the right.

---

We can implement this variant of selection sort as follows:
```ocaml
let ssort arr =
  let rec max_index i curmax =
    if i < 0 then curmax
    else max_index (i - 1) (if arr.(i) > arr.(curmax) then i else curmax)
  in
  let rec ssort' r =
    if r <= 0 then ()
    else
      let i = max_index (r - 1) r in
      swap arr i r;
      ssort' (r - 1)
  in
  ssort' (Array.length arr - 1)
```
