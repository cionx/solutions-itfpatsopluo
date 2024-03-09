# Exercise 1.10.4

> Let $y > 0$.
> Convince yourself that $\lambda x. x / y$ inverts the strictly increasing function $\lambda n. n \cdot y$.

---

We have for every number $n$ the algebraic identity $(n \cdot y) / y = n$, as can be shown by induction over $n$.
This observation means precisely that $\lambda x. x / y$ is a left-inverse to $\lambda n. n \cdot y$.
