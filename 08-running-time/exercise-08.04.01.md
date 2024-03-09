# Exercise 8.4.1

> Check with an interpreter that the execution time of $\mathit{msort}$ is moderate even for lists of length $10^5$.
> Convince yourself that the ordering of the input list doesn’t matter.

---

We use the following auxiliary function to generate ranges of integers:
```ocaml
let enum i j =
  let rec helper i j acc =
    if i > j then acc else helper i (j - 1) (j :: acc)
  in
  helper i j []
```
We use the following auxiliary function to generate lists consisting of random (non-negative) integers:
```ocaml
let rand_list n =
  let rec helper k acc =
    if k = 0 then acc else helper (k - 1) (Random.int n :: acc)
  in
  helper n []
```

We use the following auxiliary function to time function evaluation:
```ocaml
let time f x =
  let t1 = Sys.time () in
  let _ = f x in
  let t2 = Sys.time () in
  t2 -. t1
```

We will now consider three lists, each of length 10 million:
- A list sorted in ascending order.
- A list sorted in descending order.
- A list consisting of random (non-negative) integers.

We generate these lists as follows
```ocaml
let len = 10_000_000
let l_asc = enum 0 len
let l_desc = List.rev l_asc
let l_rand = rand_list len
```

Sorting these lists with $\mathit{msort}$ takes the following amounts of time:
```ocaml
# time msort l_asc;;
- : float = 211.588888

# time msort l_desc;;
- : float = 193.819692999999944

# time msort l_rand;;
- : float = 214.265403999999933
```
We see that all three lists take around the same amount of time to be sorted.
