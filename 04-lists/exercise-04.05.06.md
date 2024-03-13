# Exercise 4.5.6 (Repeating lists)

> A list is repeating if it has an element appearing at two different positions.
> For instance, `[2, 5, 3, 5]` is repeating and `[2, 5, 3]` is not repeating.
> 1. Declare a function testing whether a list is repeating.
> 2. Declare a function testing whether a list is non-repeating.
> 3. Declare a function that given a list `l` yields a non-repeating list containing the same elements as `l`.

---

### 1.

We can iterate over the list, and check for each element if it reappears later on:
```text
      repeating: ∀ α. L(α) → B
      repeating [] := false
repeating (x :: l) := mem x l || repeating l
```
In OCaml code:
```ocaml
let rec repeating l =
  match l with
  | [] -> false
  | x :: t -> List.mem x t || repeating t
```

### 2.

We can simply negate the result of `repeating`:
```text
nonrepeating l := not (repeating l)
```
In OCaml code:
```ocaml
let nonrepeating l =
  not (repeating l)
```

### 3.

We can declare this function as follows:
```text
      makeset : ∀ α. L(α) → L(α)
      makeset [] := []
makeset (x :: l) := let l' = makeset l in if mem x l' then l' else x :: l
```
In OCaml code:
```ocaml
let rec makeset l =
  match l with
  | [] -> []
  | x :: l ->
    let l' = makeset l in
    if List.mem x l' then l' else x :: l'
```
