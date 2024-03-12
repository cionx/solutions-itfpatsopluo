# Exercise 11.5.1

> How many blocks and how many fields are required to store the list `[1, 2, 3, 4]` in a heap using the linked block representation?

---

We need four blocks, each of which is two fields large, for a total of eight fields:
```text
+---+---+    +---+---+    +---+---+    +---+----+
| 1 | *----> | 2 | *----> | 3 | *----> | 4 | -1 |
+---+---+    +---+---+    +---+---+    +---+----+
```
