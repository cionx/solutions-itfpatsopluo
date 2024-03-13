# Sublists 13P

> The sublists of a list are obtained by deleting `n >= 0` positions.
> For instance, the sublists of `[1, 2]` are `[], [1], [2], [1, 2]`.
> 1. Declare a function `pow : ∀ α. L(α) → L(L(α))` that yields a list containing all sublists of a list.
> 2. Declare a function `pow' : ∀ α. N → L(α) → L(L(α))` such that `pow 0 n l` computes a list containing all sublists of `l` whose length is `n`.

---

### 1.

The only sublist of the empty list is the empty list itself.
The sublists of `x :: l` are precise the sublists of `l'` together with the lists of the form `x :: l'` where `l'` is a sublist of `l`.
These observations yield the following declaration of `pow`:
```ocaml
let rec pow l = match l with
  | [] -> [[]]
  | x :: l ->
    let p = pow l in
    List.map (List.cons x) p @ p
```

### 2.

The only sublist of length `0` is the empty list itself.
For `n <> 0`, the empty list has no sublists of length `n`.
A sublist of length `n` of `x :: l` is either a sublist of length `n` of `l` or of the form `x :: l'` for a sublist of length `n - 1` of `l`.
These observations yield the following declaration of `pow'`:
```ocaml
let rec pow' n l = match n, l with
  | 0, _ -> [[]]
  | _, [] -> []
  | n, x :: l ->
    List.map (List.cons x) (pow' (n - 1) l) @ pow' n l
```
