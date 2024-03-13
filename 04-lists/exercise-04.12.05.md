# Exercise 4.12.5 (Count Tables)

> Declare a function
> ```text
> table : ∀ α. L(α) → L(α × N+)
> ```
> such that `(x, n) ∈ table l` if and only if `x` occurs `n > 0` times in `l`.
> For instance, we want
> ```text
> table [4, 2, 3, 2, 4, 4] = [(4, 3), (2, 2), (3, 1)]
> ```
> Make sure table lists the count pairs for the elements of `l` in the order the elements appear in `l`, as in the example above.

---

We reuse the function `count` from Exercise 4.5.4:
```ocaml
let rec count' x l acc =
  match l with
  | [] -> acc
  | h :: t -> count' x t (if h = x then acc + 1 else acc)

let count x l =
  count' x l 0
```

We also reuse our solution to part c) of Exercise 4.5.6, which removes duplicate entries from a list:
```ocaml
let rec makeset l =
  match l with
  | [] -> []
  | x :: l ->
    let l' = makeset l in
    if List.mem x l' then l' else x :: l'
```
We note that this function also reverses the order of the unique elements.

We can now implement `table` as follows:
```ocaml
let table l =
  let keys = List.rev (makeset l) in
  List.map (fun key -> (key, count key l)) keys
```
