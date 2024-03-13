# Exercise 4.5.3

> Declare a tail-recursive function
> ```text
> forall : ∀ α. (α → B) → L(α) → B
> ```
> testing whether all elements of a list satisfy a given test.
> Consider two possibilities, one without a helper function, and one with `exists` exploiting the equivalence `(∀ x ∈ l. p(x)) <--> (¬∃ x ∈ l. ¬p(x))`.
>

---

We can declare `forall` as follows:
```text
forall : ∀ α. (α → B) → L(α) → B
      forall p [] := true
forall p (x :: l) := p x && forall p l
```
In OCaml code:
```ocaml
let rec forall p l =
  match l with
  | [] -> true
  | x :: l -> p x && forall p l
```

We could also implement `forall` in terms of `exists` as follows:
```text
forall p l := not (exists (λ x. not (p x)) l)
```
In OCaml code:
```ocaml
let forall p l =
  let q x = not (p x) in
  not (List.exists q l)
```
