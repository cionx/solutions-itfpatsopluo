# Exercise 2.8.1

> For the following expressions $e$ find values $v$ such that $[] \vdash e \triangleright v$ is derivable.
> Draw the derivations.  
> a) $(\lambda x. x) \enspace 1$  
> b) $(\lambda x. \lambda y. x) \enspace 1$  
> c) $(\lambda f. \lambda x. f x) (\lambda x. x)$  
> d) $\text{let rec } f \; x = x \text{ in } f$  
> e) $(\lambda y. \text{ let rec } f \; x = x \text{ in } f ) \enspace 5$

---



### a)

We have the following derivation for the expression $(\lambda x. x) \enspace 1$:
```text
----------------------------     --------------     -----------------
[]  ⊢  λ x. x  ⊳  (x, x, [])     []  ⊢  1  ⊳  1     x ⊳ 1  ⊢  x  ⊳  1
---------------------------------------------------------------------
                       []  ⊢  (λ x. x) 1  ⊳ 1
```

We can verify our result with utop:
```ocaml
# (fun x -> x) 1;;
- : int = 1
```



### b)

We have the following derivation for the expression $(\lambda x. \lambda y. x) \enspace 1$:
```text
--------------------------------------     --------------     ------------------------------------
[]  ⊢  λ x. λ y. x  ⊳  (x, λ y. x, [])     []  ⊢  1  ⊳  1     x ⊳ 1  ⊢  λ y. x  ⊳  (y, x, [x ⊳ 1])
--------------------------------------------------------------------------------------------------
                            []  ⊢  (λ x. λ y. x) 1  ⊳  (y, x, [x ⊳ 1])
```



### c)

We have the following derivation for $(\lambda f. \lambda x. f x) (\lambda x. x)$:
```text
------------------------------------------     ----------------------------     ----------------------------------------------------------
[]  ⊢  λ f. λ x. f x  ⊳  (f, λ x. f x, [])     []  ⊢  λ x. x  ⊳  (x, x, [])     f ⊳ (x, x, [])  ⊢  λ x. f x  ⊳  (x, f x, [f ⊳ (x, x, [])])
------------------------------------------------------------------------------------------------------------------------------------------
                                      []  ⊢  (λ f. λ x. f x) (λ x. x)  ⊳  (x, f x, [f ⊳ (x, x, [])])
```



### d)

We have the following derivation for $\text{let rec } f \; x = x \text{ in } f$:
```text
  -----------------------------------------
  f ⊳ (f, x, x, [])  ⊢  f  ⊳  (f, x, x, [])
---------------------------------------------
[]  ⊢  let rec f x = x in f  ⊳  (f, x, x, [])
```


### e)

We have the following derivation for $(\lambda y. \text{ let rec } f \; x = x \text{ in } f ) \enspace 5$:
```text
                                                                                          y ⊳ 5, f ⊳ (f, x, x, [y ⊳ 5])  ⊢  f  ⊳  (f, x, x, [y ⊳ 5])
------------------------------------------------------------------     --------------     ----------------------------------------------------------
[]  ⊢  λ y. let rec f x = x in f  ⊳  (y, let rec f x = x in f, [])     []  ⊢  5  ⊳  5       y ⊳ 5  ⊢  let rec f x = x in f  ⊳  (f, x, x, [y ⊳ 5])
----------------------------------------------------------------------------------------------------------------------------------------------------
                                            []  ⊢  (λ y. let rec f x = x in f) 5  ⊳  (f, x, x, [y ⊳ 5])
```
