# Exercise 8.2.1

> Define a linear time function concatenating two lists using only tail recursion.
> Hint:
> Exploit the equations `l1 @_r l2 = rev l1 @ l2` and `rev (rev l) = l`.

---

We have the equalities
```text
  l1 @ l2
= (rev (rev l1)) @ l2
= (rev l1) @_r l2
```

Calculating `l1' := rev l1` takes `O(n1)` steps and is tail-recursive, where `n1` is the length of `l1`.
Computing `l1' @_r l2` then takes a further `O(n1')` steps, where `n1'` is the length of `l1'`, and is again tail-recursive.
We have `n1' = n1`, and thus a total number of `O(n1) + O(n1') = O(n1) + O(n1) = O(n1)` steps.
