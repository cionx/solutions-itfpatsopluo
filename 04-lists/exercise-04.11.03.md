# Exercise 4.11.3
We have the equations
$$
  \begin{aligned}
    \mathit{foldl} \enspace f \enspace l \enspace b
    &=
    \mathit{fold} \enspace f \enspace (\mathit{rev} \enspace l) \enspace b
    \\
    \mathit{fold} \enspace f \enspace l \enspace b
    &=
    \mathit{foldl} \enspace f \enspace (\mathit{rev} \enspace l) \enspace b
  \end{aligned}
$$  
a) Show that the second equation follows from the first equation using
the equation $\mathit{rev} \enspace (\mathit{rev} \enspace l)) = l$.  
b) Obtain $\mathit{fold}$ from $\mathit{foldl}$ not using recursion.  
c) Obtain $\mathit{foldl}$ from $\mathit{fold}$ not using recursion.

---

### a)

It follows from the first equation and the identity $l = \mathit{rev} \enspace (\mathit{rev} \enspace l)$ that
$$
  \mathit{fold} \enspace f \enspace l \enspace b
  =
  \mathit{fold} \enspace f \enspace (\mathit{rev} \enspace (\mathit{rev} \enspace l)) \enspace b
  =
  \mathit{foldl} \enspace f \enspace (\mathit{rev} \enspace l) \enspace b \,.
$$

### b)

We can use the second formula.

### c)

We can use the first formula.
