# Exercise 6.3.4

> After having seen the simplified grammar for right-associativity, Dieter Schlau gets excited and finally comes up with a simplified grammar he claims works for left-associativity:
> $$
>   \mathit{tree}
>   \Coloneqq
>   \mathit{ptree} \mid \mathit{tree} \enspace \texttt{"B"} \enspace \mathit{ptree}
> $$
> Explain why Dieter’s grammar cannot be realized with parsing functions.

---

We have altogether the following grammar:
$$
  \begin{aligned}
    \mathit{tree}
    &\Coloneqq
    \mathit{ptree} \mid \mathit{tree} \enspace \texttt{"B"} \enspace \mathit{ptree}
    \\
    \mathit{ptree}
    &\Coloneqq
    \texttt{"A"} \mid \texttt{"("} \enspace \mathit{tree} \enspace \texttt{")"}
  \end{aligned}
$$

The textbook hasn’t explained what it means for parsing functions to “realize” a grammar, so we can’t give an actual explanation.

Intuitively speaking, to evaluate $\mathit{tree} \enspace l$, we need to decide which of the two rules for $\mathit{tree}$ to apply:
$\mathit{ptree}$ or $\mathit{tree} \; \texttt{"B"} \; \mathit{ptree}$.
However, we cannot decide this by only looking at a fixed number of leading tokens of $l$.
