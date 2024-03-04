# Exercise 4.11.1

> Using $\mathit{fold}$, declare functions that yield the concatenation, the flattening, the length, and the reversal of lists.

---

This has already been done in the book, on the same page as the exercise.
We repeat the formulas for completeness:
$$
  \begin{aligned}
    l_1 \mathbin{@} l_2
    &=
    \mathit{fold} \enspace \mathit{cons} \enspace l_1 \enspace l_2 \,,
    \\
    \mathbin{flatten} \enspace l
    &=
    \mathit{fold} \enspace ( \mathbin{@} ) \enspace l \enspace [\,] \,,
    \\
    \mathbin{length} \enspace l
    &=
    \mathit{fold} \enspace (\lambda x a. 1 + a) \enspace l \enspace 0 \,,
    \\
    \mathbin{rev} \enspace l
    &=
    \mathit{fold} \enspace (\lambda x a. a \mathbin{@} [x]) \enspace l \enspace [\,]
  \end{aligned}
$$
