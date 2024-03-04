# Exercise 4.14.1 (Lexical order for pairs)

> The idea of lexical order extends to pairs and to tuples in general.  
> a) Explain the lexical order of pairs of type $t_1 \times t_2$ given orders for the component types $t_1$ and $t_2$.  
> b) Declare a function
> $$
>   \mathit{lexP} : \forall \alpha \beta. (\alpha \to \alpha \to \mathbb{B}) \to (\beta \to \beta \to \mathbb{B}) \to \alpha \times \beta \to \alpha \times \beta \to \mathbb{B}
> $$
> testing the lexical order of pairs. For instance, we want
> $$
>   \mathit{lexP} \enspace ( ≤ ) \enspace ( ≥ ) \enspace (1, 2) \enspace (1, 3) = \mathsf{false}
> $$
> and $\mathit{lexP} \enspace ( ≤ ) \enspace ( ≥ ) \enspace (0, 2) \enspace (1, 3) = \mathsf{true}$.

---

### a)

We have $(x_1, x_2) < (y_1, y_2)$ if

- $x_1 < y_1$ or
- $x_1 = y_1$ and $x_2 < y_2$.

### b)

We can declare the function $\mathit{lexP}$ as follows:
$$
  \begin{gathered}
    \mathit{lexP} : \forall \alpha \beta. (\alpha \to \alpha \to \mathbb{B}) \to (\beta \to \beta \to \mathbb{B}) \to \alpha \times \beta \to \alpha \times \beta \to \mathbb{B} \,, \\
    \mathit{lexP} \enspace p \enspace q \enspace x \enspace y
    \coloneqq
    p \; (\pi_1 x) \; (\pi_1 y)
    \mathbin{\mathtt{\&\&}}
    \text{if } p \; (\pi_1 y) \; (\pi_1 x) \text{ then } q \; (\pi_2 x) \; (\pi_2 y) \text{ else } \mathsf{true}
  \end{gathered}
$$

In OCaml code:
```ocaml
let lexP p q (x1, x2) (y1, y2) =
  p x1 y1 && (if p y1 x1 then q x2 y2 else true)
```
