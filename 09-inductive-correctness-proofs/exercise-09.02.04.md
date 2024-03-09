# Exercise 9.2.4

> Prove $\mathit{map} \; f \; (l_1 \mathbin{@} l_2) = \mathit{map} \; f \; l_1 \mathbin{@} \mathit{map} \; f \; l_2$.

---

We use structural induction over $l_1$.

For the induction hypothesis we have
$$
  \begin{alignedat}{2}
    \mathit{map} \;f \; ([\,] \mathbin{@} l_2)
    &=
    \mathit{map} \;f \; l_2
    &&\text{definition of $\mathbin{@}$}
    \\
    &=
    [\,] \mathbin{@} \mathit{map} \;f \; l_2
    &&\text{definition of $\mathbin{@}$}
    \\
    &=
    \mathit{map} \; f \; [\,] \mathbin{@} \mathit{map} \;f \; l_2 \,.
    &\qquad&\text{definition of $\mathit{map}$}
  \end{alignedat}
$$

For the induction step we have
$$
  \begin{alignedat}{2}
    \mathit{map} \;f \; ((x :: l_1) \mathbin{@} l_2)
    &=
    \mathit{map} \;f \; (x :: (l_1 \mathbin{@} l_2))
    && \text{definition of $\mathbin{@}$}
    \\
    &=
    f \; x :: \mathit{map} \; f \; (l_1 \mathbin{@} l_2)
    && \text{definition of $\mathit{map}$}
    \\
    &=
    f \; x :: (\mathit{map} \; f \; l_1 \mathbin{@} \mathit{map} \; f \; l_2)
    && \text{induction hypothesis}
    \\
    &=
    (f \; x :: \mathit{map} \; f \; l_1) \mathbin{@} \mathit{map} \; f \; l_2
    && \text{definition of $\mathbin{@}$}
    \\
    &=
    (\mathit{map} \; f \; (x :: l_1)) \mathbin{@} \mathit{map} \; f \; l_2 \,.
    &\qquad& \text{definition of $\mathit{map}$}
  \end{alignedat}
$$
