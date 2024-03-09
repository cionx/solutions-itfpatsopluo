# Exercise 9.3.8

> Prove `map f (rev l) = rev (map f l)`.

---

We make the following observation:
```text
  map f [x]
= map f (x :: [])     definition of ( :: )
= f x :: (map f [])   definition of map
= f x :: []           definition of map
= [f x]               definition of ( :: )
```

We prove the proposed equality by induction over `l`.

For the base case we have the following equalities:
```text
  map f (rev [])
= map f []       definition of rev
= []             definition of map
= rev []         definition of rev
= rev (map f l)  definition of map
```
The induction step:
```text
  map f (rev (x :: l))
= map f (rev l @ [x])         definition of rev
= map f (rev l) @ map f [x]   Exercise 9.2.4
= rev (map f l) @ map f [x]   induction hypothesis
= rev (map f l) @ [f x]       above observation
= rev (f x :: map f l)        definition of rev
= rev (map f (x :: l))        definition of map
```
