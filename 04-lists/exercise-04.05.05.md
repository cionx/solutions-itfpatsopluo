# Exercise 4.5.5 (Inclusion)

> Declare a function
> $$
>   \mathit{incl} : \forall \alpha. \; \mathcal{L}(\alpha) \to \mathcal{L}(\alpha) \to \mathbb{B}
> $$
> which tests whether all elements of the first list are elements of the second list.

---

We use $\mathit{forall}$ from Exercise 4.5.3 and $\mathit{mem}$ from Exercise 4.5.1:
$$
  \mathit{incl} \enspace l_1 \enspace l_2
  \coloneqq
  \mathit{forall} \enspace (\lambda x. \mathit{mem} \enspace x \enspace l_2) \enspace l_1 \,.
$$
