# Exercise 4.10.1 (Graded power list)

> Declare a function `gpow : ∀ α. N → L(α) → L(L(α))` such that `gpow k l` yields a list containing all sublists of `l` of length `k`.

---

We make the following observations:
- The only sublist of length `0` is the empty list, `[]`.
- If `k > 0` then the empty list has not sublists of length `k`.
- In general, a sublist of `x :: l` of length `k` is either a sublist of `l` of length `k` or of the form `x :: l'` for a sublist `l'` of `l` of length `k - 1`.

We thus arrive at the following declaration:
```text
gpow : ∀ α. N → L(α) → L(L(α))
       gpow 0 l := [[]]
      gpow k [] := []
gpow k (x :: l) := map (λ l. x :: l) (gpow (k - 1) l) @ gpow k l
```
In OCaml code:
```ocaml
let rec gpow k l =
  if k < 0 then invalid_arg "gpow" else
    match k, l with
    | 0, _ -> [[]]
    | _, [] -> []
    | k, x :: l -> List.map (fun l -> x :: l) (gpow (k - 1) l) @ gpow k l 
```
