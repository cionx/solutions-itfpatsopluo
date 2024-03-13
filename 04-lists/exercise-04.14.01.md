# Exercise 4.14.1 (Lexical order for pairs)

> The idea of lexical order extends to pairs and to tuples in general.  
> 1. Explain the lexical order of pairs of type `t1 × t2` given orders for the component types `t1` and `t2`.
> 2. Declare a function
>    ```text
>    lexP : ∀ α β. (α → α → B) → (β → β → B) → α × β → α × β → B
>    ```
>    testing the lexical order of pairs.
>    For instance, we want
>    ```text
>    lexP ( <= ) ( >= ) (1, 2) (1, 3) = false
>    ```
>    and `lexP ( ≤ ) ( ≥ ) (0, 2) (1, 3) = true`.

---

### 1.

We have `(x1, x2) < (y1, y2)` if

- `x1 < y1` or
- `x1 = y1` and `x2 < y2`.

### 2.

We can declare the function `lexP` as follows:
```text
        lexP : ∀ α β. (α → α → B) → (β → β → B) → α × β → α × β → B
lexP p q x y := p (π1 x) (π1 y) && (if p (π1 y) (π1 x) then q (π2 x) (π2 y) else true)
```
In OCaml code:
```ocaml
let lexP p q (x1, x2) (y1, y2) =
  p x1 y1 && (if p y1 x1 then q x2 y2 else true)
```
