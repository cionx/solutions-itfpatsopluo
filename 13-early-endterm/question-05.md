# Prefixes, suffixes, segments 12P

> Given a list `l = l1 @ l2 @ l3`, we call `l1` a prefix, `l2` a segment, and `l3` a suffix of `l`.
> The lists `l1`, `l2`, and `l3` may be empty.
>
> 1. Declare a function `∀ α. L(α) → L(L(α))` that yields a list containing all suffixes of a list.
> 2. Declare a function `∀ α. L(α) → L(L(α))` that yields a list containing all prefixes of a list.
> 3. Declare a function `∀ α. L(α) → L(L(α))` that yields a list containing all segments of a list.
>
> You may use the functions `List.cons`, `List.map`, and `List.concat`.

---

### 1.

The only suffix of the empty list is the empty list itself.
Every suffix of `x :: l` of either all of `x :: l` or a suffix of `l`.
These observations yield the following declaration for the described function:
```ocaml
let rec suf l = match l with
  | [] -> [[]]
  | x :: l -> (x :: l) :: suf l
```

### 2.

The only prefix of the empty list is the empty list itself.
The prefixes of `x :: l` are the empty list and `x :: l'` where `l'` is a prefix of `l`.
These observations yield the following declaration for the described function:
```ocaml
let rec pre l = match l with
  | [] -> [[]]
  | x :: l -> [] :: List.map (List.cons x) (pre l)
```

### 3.

The only segment of the empty list is the empty list itself.
The segments of `x :: l` are either segments of `l` or of the form `x :: l'` for a prefix `l'` of `l`.
These observations yield the following declaration for the described function:
```ocaml
let rec seg l = match l with
  | [] -> [[]]
  | x :: l -> List.map (List.cons x) (pre l) @ seg l
```
