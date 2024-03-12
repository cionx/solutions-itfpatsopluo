# Exercise 11.6.3

> Declare a function that given a number `n > 0` allocates a cyclic list `[1, 2, ... , n, ...]` in the heap `H`.

---

The following function converts a list `[x0, ..., xn]` into a cyclic list `[x0, ..., xn, x0, ...]`:
```ocaml
let putclist l =
  let rec loop l = match l with
    | [] -> invalid_arg "putclist: empty list"
    | [x] ->
      let a = alloc' [x; -1] in (a, a)
    | x :: l ->
      let (first, last) = loop l in
      let newfirst = alloc' [x; first] in
      (newfirst, last)
  in
  let (first, last) = loop l in
  H.set last 1 first;
  first
```

We can declare the described function by applying `putclist` to the list `[1, ..., n]`:
```ocaml
let repeat n =
  putclist (List.init n (fun i -> i + 1))
```
