# Exercise 1.9.1

> a) Write $\lambda x y k. (k + 1) \cdot y > x$ as a nested lambda expression.  
> b) Write $\mathit{test} \; 11 \; 3 \; 10$ as a nested application.  
> c) Write $\mathit{int} \to \mathit{int} \to \mathit{int} \to \mathit{bool}$ as a nested function type.

---

### a)

$\lambda x. \lambda y. \lambda k. (k + 1) \cdot y > x$

### b)

$\mathit{test} \; 11 \; 3 \; 10 = ((\mathit{test} \; 11) \; 3) \; 10$

### c)

$\mathit{int} \to (\mathit{int} \to (\mathit{int} \to \mathit{bool}))$
