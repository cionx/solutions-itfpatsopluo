# Exercise 10.3.1 (Linear search)

> Declare a function
> ```text
> lsearch : ∀ α. array(α) → α → O(N)
> ```
> that checks whether a value occurs in an array and in the positive case yields an index where the value occurs.
> The running time of `lsearch` should be `O(n)` where `n` is the length of the array.

---

We can declare the described function as follows in OCaml:
```ocaml
let lsearch arr x =
  let n = Array.length arr in
  let rec loop i =
    if i >= n then None
    else if x = arr.(i) then Some i
    else loop (i + 1)
  in
  loop 0
```
