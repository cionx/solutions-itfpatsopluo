# Exercise 5.5.5

> Note that the grammar in §5.4 does not use delegation in the first rule for $\mathit{tree}$.
> Give an equivalent linearization grammar using delegation in both rules.

---

The grammar in section 5.4 is as follows:
$$
  \begin{aligned}
    \mathit{tree}  &\Coloneqq \mathtt{"A"} \mid \mathit{tree} \; \mathtt{"B"} \; \mathit{ptree} \\
    \mathit{ptree} &\Coloneqq \mathtt{"A"} \mid \mathtt{"("} \; \mathit{tree} \; \mathtt{")"}
  \end{aligned}
$$
It seems to us that both rules already use delegation.
(The book should probably give a better explanation of what “delegation” means.)
