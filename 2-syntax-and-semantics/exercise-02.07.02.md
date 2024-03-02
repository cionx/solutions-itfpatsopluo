# Exercise 2.7.2

> Two expressions are alpha equivalent if they are equal up to consistent renaming of local variables.
> For instance, $\lambda x. x$ and $\lambda y. y$ are alpha equivalent.
> Consistent renaming of local variables is also known as alpha renaming.
> For each of the following expressions give an alpha equivalent expression such that no variable has more than one binding occurrence.  
> a) $(\lambda x. x) (\lambda x. x)$  
> b) $\lambda x. \lambda x. \lambda x. x$  
> c) $\text{let rec } x x = x \text{ in } x$

---

The expression $(\lambda x. x) (\lambda x. x)$ is alpha equivalent to $(\lambda x. x) (\lambda y. y)$.

The expression $\lambda x. \lambda x. \lambda x. x$ is alpha equivalent to $\lambda x. \lambda y. \lambda z. z$.

The expression $(\text{let rec } x x = x \text{ in } x)$ is alpha equivalent to $(\text{let rec } f x = x \text{ in } f)$.
