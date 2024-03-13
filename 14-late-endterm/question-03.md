# Linear search 8P

> Declare a function `find : ∀ α. α → L(α) → O(N)` that for `x` and `l` returns the first position `x` occurs in `l`.
> For instance, `find 3 [3, 2, 3] = Some 0` and `find 1 [3, 2, 3] = None`.
> Use only tail recursion.

---

We can declare the function `find` as follows:
```ocaml
let find x l =
  let rec loop i l = match l with
    | [] -> None
    | y :: l ->
      if x = y then Some i else loop (i + 1) l
  in
  loop 0 l
```
