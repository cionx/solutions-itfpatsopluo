# Exercise 10.5.1

> Declare a function `sorted : ∀ α. array(α) → B` that checks whether an array is sorted.
> Do not convert to lists.
> Also write a function that checks whether an array is strictly sorted (i.e., sorted and no element occurring twice).

---

We can implement both functions in terms of an auxiliary function:
```ocaml
(** [forallnbs p arr] is [p arr.(0) arr(1) && ... && p arr.(n - 2) arr.(n - 1)],
    where [n] is the length of arr. *)
let forallnbs p arr =
  let n = Array.length arr in
  let rec loop i =
    if i >= n then true
    else p arr.(i - 1) arr.(i) && loop (i + 1)
  in
  loop 1

let sorted arr = forallnbs ( <= ) arr
let strictly_sorted arr = forallnbs ( < ) arr
```
(We could also define `sorted` via partial application as `forallnbs ( <= )`, and similarly for `strictly_sorted`.
But then OCaml has problems deriving the polymorphic type of these functions, using weak types instead.)
