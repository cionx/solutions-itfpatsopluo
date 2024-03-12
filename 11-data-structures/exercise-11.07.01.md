# Exercise 11.7.1

> Consider the ABC-tree
> ```text
> B( C(A, B(A, A)), B(A, A))
> ```
> with a block representation employing the tags `0` and `1` for the constructors `B` and `C`.
> 1. Draw a block representation without structure sharing.
> 2. Draw a block representation with structure sharing.
> 3. Give an expression allocating the tree with structure sharing.

---

### 1.

The ABC-tree looks as follows:
```text
         B
        / \
       /   \
      /     \
     /       \
    /         \
   C           B
  / \         / \
 /   \       /   \
A     B     A     A
     / \
    /   \
   A     A
```
Its block representation looks as follows:
```text
+---+---+---+     +---+----+----+
| 0 | * | *-----> | 0 | -1 | -1 |
+---+-|-+---+     +---+----+----+
      |
      |
      v
    +---+----+---+     +---+----+----+
    | 1 | -1 | *-----> | 0 | -1 | -1 |
    +---+----+---+     +---+----+----+
```

### 2.

With structure sharing the block representation looks as follows:
```text
+---+---+---+     +---+----+----+
| 0 | * | *-----> | 0 | -1 | -1 |
+---+-|-+---+     +---+----+----+
      |             ^
      |             |
      v             |
    +---+----+---+  |
    | 1 | -1 | *----+
    +---+----+---+
```

### 3.

We name the blocks as follows:
```text
    +---+---+---+     +---+----+----+
 a  | 0 | * | *-----> | 0 | -1 | -1 |  c
    +---+-|-+---+     +---+----+----+
          |             ^
          |             |
          v             |
        +---+----+---+  |
        | 1 | -1 | *----+
        +---+----+---+
              b
```
We can allocate the given ABC-tree as follows:
```ocaml
let c = alloc' [0; -1; -1]
let b = alloc' [1; -1; c]
let a = alloc' [0; b; c]
```
