# Exercise 4.2.2

> Consider the expression $1 :: 2 :: [] \mathbin{@} 3 :: 4 :: []$.
> 1. Put in the redundant parentheses.
> 2. Give the list the expression evaluates to in bracket notation.
> 3. Give the tree representation of the list the expression evaluates to.

---

### 1.

We can parenthesize the given expression as follows:
$$
(1 :: (2 :: [])) \mathbin{@} (3 :: (4 :: [])) \,.
$$

### 2.

The expression evaluates to $[1, 2] \mathbin{@} [3, 4]$, which further evaluates to $[1, 2, 3, 4]$.

### 3.

The tree representation for $[1, 2, 3, 4]$ is as follows:
```text
   ::
  /  \
 /    \
1     ::
     /  \
    /    \
   2     ::
        /  \
       /    \
      3     ::
           /  \
          /    \
         4     []
```
