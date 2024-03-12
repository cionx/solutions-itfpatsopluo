# Merge sort with duplicate removal 12P

> The merge sort algorithm for lists can be modified such that it sorts a list and also removes duplicates.
> For instance, for the list `[3, 2, 3, 2, 1]` we want the list `[1, 2, 3]`.
> 1. Declare a function `merge : ∀ α. L(α) → L(α) → L(α)` merging two duplicate-free sorted lists into one duplicate-free sorted list.
>    For instance, we want `merge [1, 2] [2, 3] = [1, 2, 3]`.
>    The running time of `merge` should be at most linear in the sum of the lengths of the two input lists.
> 2. Given a function `split : ∀ α. L(α) → L(α) → L(α) → L(α) × L(α)` splitting lists and the merge function from (1), declare a function `sort : ∀ α. L(α) → L(α)` that sorts and removes duplicates.
>    The running time of sort should be `O(n log n)`
>    Assume that `split` splits a list into two lists of equal size (plus/minus 1) and has running time linear in the size of the input list.

---

### 1.

We can declare the function `merge` as follows:
```ocaml
let merge l1 l2 =
  let rec loop l1 l2 acc = match l1, l2 with
    | l1, [] -> List.rev acc @ l1
    | [], l2 -> List.rev acc @ l2
    | x :: l1, y :: l2 ->
      if x < y then loop l1 (y :: l2) (x :: acc)
      else if x > y then loop (x :: l1) l2 (y :: acc)
      else loop l1 l2 (x :: acc)
  in
  loop l1 l2 []
```

### 2.

We can declare the function `sort` as follows:
```ocaml
let rec sort l = match l with
  | [] -> []
  | [x] -> [x]
  | l ->
    let (l1, l2) = split l in
    merge (sort l1) (sort l2)
```
