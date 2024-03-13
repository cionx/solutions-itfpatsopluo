# Exercise 4.2.3
Decide for each of the following equations whether it is well-typed, and, in case it is well-typed, whether it is true.
Assume `l1, l2 : L(N)`.
1. `1 :: 2 :: 3 = 1 :: [2, 3]`
2. `1 :: 2 :: 3 :: [] = 1 :: (2 :: [3])`
3. `l1 :: [2] = l1 @ [2]`
4. `(l1 @ [2]) @ l2 = l1 @ (2 :: l2)`
5. `(l1 :: 2) @ l2 = l1 @ (2 :: l2)`
6. `map (λ x. x^2) [1, 2, 3] = [1, 4, 9]`
7. `rev (l1 @ l2) = rev l2 @ rev l1`

### 1.

The expression `1 :: 2 :: 3` is not well-typed because `3` is not a list.

### 2.

This equation is true, and both sides have type `L(N)`.

### 3.

The expression `l1 :: [2]` is not well-defined because `l1` and `2` have different types.

### 4.

This equation is true, and both sides have type `L(N)`.

### 5.

The subexpression `l1 :: 2` is not well-typed because `2` is not a list.

### 6.

This equation is true, and both sides have type `L(N)`.

### 7.

The equation is true, and both sides have type `L(N)`.
