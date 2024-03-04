# Exercise 4.11.2

> Using $\mathit{foldl}$, declare functions that yield the length, the reversal, and the concatenation of lists.

---

We can use the following formulas:
$$
  \begin{aligned}
    \textit{length} \enspace l
    &=
    \mathit{foldl} \enspace (\lambda x a. 1 + a) \enspace l \enspace 0
    \\
    \textit{rev} \enspace l
    &=
    \mathit{foldl} \enspace (\lambda x a. x :: a) \enspace l \enspace 0
    \\
    \textit{concat} \enspace l_1 \enspace l_2
    &=
    \mathit{foldl} \enspace (\lambda x a. a \mathbin{@} [x]) \enspace l_2 \enspace l_1
  \end{aligned}
$$
In OCaml code:
```ocaml
let length l = foldl (fun x a -> 1 + a) l 0

let rev l = foldl (fun x a -> x :: a) l []

let concat l1 l2 = foldl (fun x a -> a @ [x]) l2 l1
```
