# Exercise 2.2.1

> Draw syntax trees for the following phrases in lexical representation.
> 1. `int × int → bool`
> 2. `int × (int × int) × int → bool`

---

### 1.

```text
       →
      / \
     /   \
    ×     \
   / \     \
  /   \     \
int   int   bool
```

### 2.

```text
        →
       / \
      /   \
     ×    bool
    /|\
   / | \
  /  |  \
int  ×  int
    / \
   /   \
 int   int
