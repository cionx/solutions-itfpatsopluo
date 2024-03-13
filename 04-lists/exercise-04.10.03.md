# Exercise 4.10.3 (Splits)

> Given a list `l = l1 @ l2`, we call the pair `(l1, l2)` a **split** of `l`.
> Declare a function that yields a list containing all splits of a list.

---



### First solution

We first declare an auxiliary function `splits'` as follows:
```text
splits' : ∀ α. L(α) → L(α) → L(L(α) × L(α)) → L(L(α) × L(α))
      splits' l1 [] acc := (rev l1, []) :: acc
splits' l1 (x :: l) acc := splits' (x :: l1) l ((rev l1, x :: l) :: acc)
```
In the call `splits' l1 l2 acc`, the arguments have the following roles:
- `acc` keeps track of the splits we have constructed so far.
- `l1` is the left part of the next split, saved in reversed order.
- `l2` is the right side of the next split.

In each iteration we are moving the leading element of the right side to the end of the left side.

We can now declare the function `splits` as follows:
```text
splits : ∀ α. L(α) → L(L(α) × L(α))
splits l := splits' [] l []
```
In OCaml code:
```ocaml
let rec splits' l1 l2 acc =
  match l2 with
  | [] -> (List.rev l1, []) :: acc
  | x :: l -> splits' (x :: l1) l ((List.rev l1, l2) :: acc)

let splits l =
  splits' [] l []
```

Our implementation seems to work:
```ocaml
# splits [1; 2; 3];;
- : (int list * int list) list =
[([1; 2; 3], []); ([1; 2], [3]); ([1], [2; 3]); ([], [1; 2; 3])]
```



### Second solution

The only split of the empty list is the pair `([], [])`.
Every split of `x :: l` is either
- `([] x :: l)`, or of the form
- `(x :: l1, l2)` where `(l1, l2)` is a split of `l`.

These observations result in the following function declaration:
```ocaml
let rec splits2 l =
  match l with
  | [] -> [([], [])]
  | x :: l ->
    let s = splits2 l in
    let s' = List.map (fun (l1, l2) -> (x :: l1, l2)) s in
    ([], x :: l) :: s'
```
