# Exercise 4.10.2 (Prefixes, Segments, Suffixes)

> Given a list `l = l1 @ l2 @ l3`, we call `l1` a prefix, `l2` a segment, and `l3` a suffix of `l`.
> The definition is such that prefixes are segments starting at the beginning of a list, and suffixes are segments ending at the end of a list.
> Moreover, every list is a prefix, segment, and suffix of itself.
> 1. Convince yourself that segments are sublists.
> 2. Give a list and a sublist that is not a segment of the list.
> 3. Declare a function that yields a list containing all prefixes of a list.
> 4. Declare a function that yields a list containing all suffixes of a list.
> 5. Declare a function that yields a list containing all segments of a list.

---

### 1.

I have convinced myself.

### 2.

We can consider the list `[1, 2, 3]` and sublist `[1, 3]`.
(This is the minimal counterexample.)

### 3.

The only prefix of the empty list is the empty list.
Every prefix of a nonempty list `x :: l` is either
- empty, or
- of the form `x :: l'` for a prefix `l'` of `l`.

We thus arrive at the following declaration:
```text
      prefixes : ∀ α. L(α) → L(L(α))
      prefixes [] := [[]]
prefixes (x :: l) := [] :: map (λ p. x :: p) (prefixes l)
```
In OCaml code:
```ocaml
let rec prefixes l =
  match l with
  | [] -> [[]]
  | x :: l -> [] :: List.map (fun p -> x :: p) (prefixes l)
```

### 4.

The only suffix of the empty list is the empty list itself.
The suffixes of a nonempty list `x :: l` are
- the entire list, and
- the suffixes of `l`.

We thus arrive at the following declaration:
```text
      suffixes : ∀ α. L(α) → L(L(α))
      suffixes [] := [[]]
suffixes (x :: l) := (x :: l) :: suffixes l
```
In OCaml code:
```ocaml
let rec suffixes l =
  match l with
  | [] -> [[]]
  | x :: l' -> l :: suffixes l'
```

### 5.

The only segment of the empty list is the empty list itself.
The segments of a non-empty list `x :: l` are precisely
- the segments of `l`, and
- the nonempty prefixes of `x :: l`, i.e., those prefixes of the form `x :: l'` for a prefix `l'` of `l`.

Based on these observations we declare the desired function as follows:
```text
      segments : ∀ α. L(α) → L(L(α))
      segments [] := [[]]
segments (x :: l) := map (λ p. x :: p) (prefixes l) @ segments l
```
In OCaml code:
```ocaml
let rec segments l =
  match l with
  | [] -> [[]]
  | x :: l -> List.map (fun l' -> x :: l') (prefixes l) @ segments l
```
