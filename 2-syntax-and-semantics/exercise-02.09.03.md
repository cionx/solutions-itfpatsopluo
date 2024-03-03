# Exercise 2.9.3 (Recursive lambda expressions)

> We may extend our language with recursive lambda expressions $\rho f x. e$ describing a recursive function with a local variable $f$ serving as function name.
> Note that the Greek letter $\rho$ takes the place of the Greek letter $\lambda$.  
> a) Explain recursive lambda expressions $\rho f x. e$ as derived form.  
> b) Give a typing rule for recursive lambda expressions $\rho f x. e$ assuming they are abstract expressions.  
> c) Give an evaluation rule for recursive lambda expressions $\rho f x. e$ assuming they are abstract expressions.

---



### a)

We can express $\rho f x. e$ as follows:
$$
  \text{let rec } f \; x = e \text{ in } f \,.
$$



### b)

We have two approaches:

#### First approach

We have the following typing rule for $\text{let rec}$ expressions:
```text
E, f : t1 → t2, x : t1  ⊢  e1 : t2     E, f : t1 → t2  ⊢  e2 : t
----------------------------------------------------------------
                E  ⊢  let rec f x = e1 in e2 : t
```
Motivated by part a) of this exercise we consider the following derived typing rule (we replace $e_1$ with $e$ end $e_2$ with $f$):
```text
E, f : t1 → t2, x : t1  ⊢  e : t2     E, f : t1 → t2  ⊢  f : t
--------------------------------------------------------------
                E  ⊢  let rec f x = e in f : t
```
The condition $E, f : t_1 → t_2 \vdash f : t$ gives $t = t_1 \to t_2$, whence we can simplify the above typing rule as follows:
```text
 E, f : t1 → t2, x : t1  ⊢  e : t2
------------------------------------
E  ⊢  let rec f x = e in f : t1 → t2
```
Finally, we re-express this typing rule with a recursive lambda expression:
```text
 E, f : t1 → t2, x : t1  ⊢  e : t2
----------------------------------
     E  ⊢  ρ f x. e : t1 → t2
```

#### Second approach

The typing rule for non-recursive lambda expressions is as follows:
```text
 E, x : t1  ⊢  e : t2
----------------------
E  ⊢  λ x. e : t1 → t2
```

In the recursive case we also need to consider that $f$ may appear in $e$, leading to the following modified typing rule:
```text
E, f : t1 → t2, x : t1  ⊢  e : t2
---------------------------------
    E  ⊢  ρ f x. e : t1 → t2
```



### c)

A recursive lambda expression evaluates to a closure for recursive functions:
```text
-------------------------------
V  ⊢  ρ f x. e  ⊳  (f, x, e, V)
```
