# Exercise 4.2.3
Decide for each of the following equations whether it is well-typed, and, in case it is well-typed, whether it is true.
Assume $l_1, l_2 : \mathcal{L}(N)$.  
a) $1 :: 2 :: 3 = 1 :: [2, 3]$  
b) $1 :: 2 :: 3 :: [] = 1 :: (2 :: [3])$  
c) $l_1 :: [2] = l_1 \mathbin{@} [2]$  
d) $(l_1 \mathbin{@} [2]) \mathbin{@} l_2 = l_1 \mathbin{@} (2 :: l_2)$  
e) $(l_1 :: 2) \mathbin{@} l_2 = l_1 \mathbin{@} (2 :: l_2)$  
f) $\mathit{map} \; (\lambda x. x^2) \;[1, 2, 3] = [1, 4, 9]$  
g) $\mathit{rev} \; (l_1 \mathbin{@} l_2) = \mathit{rev} \enspace l_2 \mathbin{@} \mathit{rev} \enspace l_1$

### a)

The expression $1 :: 2 :: 3$ is not well-typed because $3$ is not a list.

### b)

This equation is true, and both sides have type $\mathcal{L}(\mathbb{N})$.

### c)

The expression $l_1 :: [2]$ is not well-defined because $l_1$ and $2$ have different types.

### d)

This equation is true, and both sides have type $\mathcal{L}(\mathbb{N})$.

### e)

The subexpression $l_1 :: 2$ is not well-typed because $2$ is not a list.

### f)

This equation is true, and both sides have type $\mathcal{L}(\mathbb{N})$.

### g)

The equation is true, and both sides have type $\mathcal{L}(\mathbb{N})$.
