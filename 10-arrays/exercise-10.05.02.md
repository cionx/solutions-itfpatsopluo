# Exercise 10.5.2

> Declare functions that for a nonempty array yield an index such that the value at the index is minimal (or maximal) for the array.

---

We can declare such a function as follows:
```ocaml
let max_index arr =
  let n = Array.length arr in
  let rec loop i curmax =
    if i >= n then Some curmax
    else if arr.(i) > arr.(curmax) then loop (i + 1) i
    else loop (i + 1) curmax
  in
  if n = 0 then None else loop 1 0
```
