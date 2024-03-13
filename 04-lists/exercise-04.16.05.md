# Exercise 4.16.5 (Maps with memory)

> Note that `lookup` searches maps from left to right until it finds a pair with the given key.
> This opens up the possibility to keep previous values in the map by modifying update so that it simply appends the new key-value pair in front of the list:
> ```text
> update l a b := (a, b) :: l
> ```
> Redo the previous exercises for the new definition of update.
> Also define a function
> ```text
> lookup_all : ∀ α β. map α β → α → L(β)
> ```
> that yields the list of all values for a given key.

---

### Exercise 4.16.1

Our solution to this exercise remains unchanged.

### Exercise 4.16.2

The overall results don’t change, but the formulas in the argumentations become simpler.

### Exercise 4.16.3

Our solution to this exercise doesn’t change.

### Exercise 4.16.4

We now have to keep iterating over the rest of the list, even after deleting an entry:
```text
           delete : ∀ α β. map α β → α → map α β
           delete [] a := []
delete ((a', b') :: m) := let m' = delete m a in if a = a' then m' else (a', b') :: m'
```
In OCaml code:
```ocaml
let rec delete m a =
  match m with
  | [] -> []
  | (a', b') :: m ->
    let m' = delete m a in
    if a = a' then m' else (a', b') :: m'
```

### `lookup_all`

We can declare the function `lookup_all` as follows:
```text
             lookup_all : ∀ α β. map α β → α → L(β)
             lookup_all [] a := []
lookup_all ((a', b') :: m) a := let v = lookup m a in if a = a' then b' :: v else v
```
In OCaml code:
```ocaml
let rec lookup_all m a =
  match m with
  | [] -> []
  | (a', b') :: m ->
    let values = lookup_all m a in
    if a = a' then b' :: values else values
```
