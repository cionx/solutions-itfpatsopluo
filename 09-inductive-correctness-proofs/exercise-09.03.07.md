# Exercise 9.3.7

> Prove $\mathit{rev} \; (\mathit{rev} \; l) = l$.

---

We first make the following two observations:

1. $\mathit{rev} \; [x] = \mathit{rev} \; (x :: [\,]) = (\mathit{rev} \; [\,]) \mathbin{@} [x] = [\,] \mathbin{@} [x] = [x]$

2. $[x] \mathbin{@} l = (x :: [\,]) \mathbin{@} l = x :: ([\,] \mathbin{@} l) = x :: l$

We show the proposed equality by induction over $l$.

If $l$ is the empty list, then
$$
  \begin{alignedat}{2}
    \mathit{rev} \; (\mathit{rev} \; l)
    &=
    \mathit{rev} \; (\mathit{rev} \; [\,])
    &\qquad&\text{choice of $l$}
    \\
    &=
    \mathit{rev} \; [\,]
    &\qquad&\text{definition of $\mathit{rev}$}
    \\
    &=
    [\,]
    &\qquad&\text{definition of $\mathit{rev}$}
    \\
    &=
    l
    &\qquad&\text{choice of $l$}
  \end{alignedat}
$$

For the induction step we have
$$
  \begin{alignedat}{2}
    \mathit{rev} \; (\mathit{rev} \; (x :: l))
    &=
    \mathit{rev} \; (\mathit{rev} \; l \mathbin{@} [x])
    &\qquad&\text{definition of $\mathit{rev}$}
    \\
    &=
    \mathit{rev} \; [x] \mathbin{@} \; \mathit{rev} \; \mathit{rev} \; l
    &\qquad&\text{Fact 9.3.1}
    \\
    &=
    \mathit{rev} \; [x] \mathbin{@} l
    &\qquad&\text{induction hypothesis}
    \\
    &=
    [x] \mathbin{@} l
    &\qquad&\text{first observation}
    \\
    &=
    x :: l \,.
    &\qquad&\text{second observation}
  \end{alignedat}
$$
