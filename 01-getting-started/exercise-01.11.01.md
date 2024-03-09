# Exercise 1.11.1 (Factorials)

> In mathematics, the factorial of a positive integer $n$, denoted by $n!$, is the product of all positive integers less than or equal to $n$:
> $$
>   n! = n \cdot (n − 1) \dotsm 2 \cdot 1 \,.
> $$
> For instance,
> $$
>   5! = 5 \cdot 4 \cdot 3 \cdot 2 \cdot 1 = 120 \,.
> $$
> In addition, $0!$ is defined as $1$.
> We capture this specification with a recursive function defined as follows:
> $$
>   \begin{aligned}
>   ! \colon \mathbb{N} \to \mathbb{N}& \,, \\
>         0! &\coloneqq 1 \,, \\
>   (n + 1)! &\coloneqq (n + 1) \cdot n! \,.
>   \end{aligned}
> $$
> a) Declare a function $\mathit{fac} \colon \mathit{int} \to \mathit{int}$ computing factorials.  
> b) Define a tail recursion function $\mathit{f} \colon \mathbb{N} \to \mathbb{N} \to \mathbb{N}$ such that $n! = f \; 1 \; n$.  
> c) Declare a tail recursive function $\mathit{fac}' \colon \mathit{int} \to \mathit{int} \to \mathit{int}$ such that $\mathit{fac}' \; 1$ computes factorials.

---

### a)

We can declare this function as follows:
```ocaml
let rec fac n =
  if n = 0 then 1 else n * fac (n - 1)
```

### b)

We can define the function $f$ as follows:
$$
  f \; a \; n
  \coloneqq
  \begin{cases}
    a                           & \text{if $n = 0$,} \\
    f \; (n \cdot a) \; (n - 1) & \text{if $n > 0$.}
  \end{cases}
$$
Indeed, we find that
$$
  \begin{aligned}
       f \; 1 \; n
    &= f \; n \; (n - 1) \\
    &= f \; ((n - 1) \cdot n) \; (n - 2) \\
    &= f \; ((n - 2) \cdot (n - 1) \cdot n) \; (n - 3) \\
    &= \dotsb \\
    &= f \; (1 \cdot 2 \dotsm (n - 2) \cdot (n - 1) \cdot n) \; 0 \\
    &= 1 \cdot 2 \dotsm (n - 2) \cdot (n - 1) \cdot n \\
    &= n! \,.
  \end{aligned}
$$

### c)

We can declare the function $\mathit{fac}'$ as follows:
```ocaml
let rec fac' a n =
  if n = 0 then a else fac' (n * a) (n - 1)
```
