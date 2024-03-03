# Exercise 3.4.1

> Declare a test $\mathit{exists} : \mathit{int} \to \mathit{int} \to (\mathit{int} \to \mathit{bool}) \to \mathit{bool}$ such that $\mathit{exists} \; m \; n \; f = \mathsf{true} \longleftrightarrow \exists k, m \leq k \leq n. f k = \mathsf{true}$ in two ways:  
> a) Directly following the design of $\mathit{forall}$.  
> b) Using $\mathit{forall}$ and boolean negation $\mathit{not} : \mathit{bool} \to \mathit{bool}$.

---

### a)

We can directly implement $\mathit{exists}$ as follows:
```ocaml
let rec exists m n f =
  if m > n then false else f m || exists (m + 1) n f
```

### b)

It follows from De Morgan’s laws that
$$
  p_1 \vee \dotsb \vee p_n
  \iff
  \neg (\neg p_1 \wedge \dotsb \wedge \neg p_n) \,.
$$
We can therefore implement $\mathit{exists}$ in terms of $\mathit{forall}$ and the negation function $\mathit{not}$:
```ocaml
let rec exists m n f =
  let notf x = not (f x) in
  not (forall m n notf)
```
