# Exercise 8.2.1

> Define a linear time function concatenating two lists using only tail recursion.
> Hint:
> Exploit the equations $l_1 \mathbin{@}_{\mathrm{r}} l_2 = \mathit{rev} \; l_1 \mathbin{@} l_2$ and $\mathit{rev} \enspace (\mathit{rev} \enspace l) = l$.

---

We have the identity
$$
  l_1 \mathbin{@} l_2
  =
  (\mathit{rev} \enspace (\mathit{rev} \enspace l_1)) \mathbin{@} l_2
  =
  (\mathit{rev} \enspace l_1) \mathbin{@}_{\mathrm{r}} l_2 \,.
$$

Calculating $l'_1 \coloneqq \mathit{rev} \enspace l_1$ takes $O(n_1)$ steps and is tail-recursive, where $n_1$ is the length of $l_1$.
Computing $l'_1 \mathbin{@}_{\mathrm{r}} l_2$ then takes a further $O(n'_1)$ steps, where $n'_1$ is the length of $l'_1$, and is again tail-recursive.
We have $n'_1 = n_1$, and thus a total number of $O(n_1) + O(n'_1) = O(n_1) + O(n_1) = O(n_1)$ steps.
