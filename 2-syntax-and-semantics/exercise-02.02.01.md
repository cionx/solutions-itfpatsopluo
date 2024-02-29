# Exercise 2.2.1

> Draw syntax trees for the following phrases in lexical representation.  
> a) $\mathit{int} \times \mathit{int} \to \mathit{bool}$  
> b) $\mathit{int} \times (\mathit{int} \times \mathit{int}) \times \mathit{int} \to \mathit{bool}$

---

### a)

```text
       →
      / \
     /   \
    ×     \
   / \     \
  /   \     \
int   int   bool
```

### b)

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
