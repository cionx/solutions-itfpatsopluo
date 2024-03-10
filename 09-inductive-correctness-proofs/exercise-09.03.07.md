# Exercise 9.3.7

> Prove `rev (rev l) = l`.

---

We first make the following two observations:

1. ```text
     rev [x]
   = rev (x :: [])  definition of ( :: )
   = rev [] @ [x]   definition of rev
   = [] @ [x]       definition of rev
   = [x]            definition of @
   ```

2. ```text
     [x] @ l
   = (x :: []) @ l  definition of ( :: )
   = x :: ([] @ l)  definition of @
   = x :: l         definition of @

We show the proposed equality by induction over `l`.

Base case:
```text
  rev (rev [])
= rev []        definition of rev
= []            definition of rev
```
Induction step:
```text
  rev (rev (x :: l))
= rev (rev l @ [x])       definition of rev
= rev [x] @ rev (rev l)   Fact 9.3.1
= rev [x] @ l             induction hypothesis
= [x] @ l                 first observation
= x :: l                  second observation
```
