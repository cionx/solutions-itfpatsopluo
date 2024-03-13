# Exercise 5.5.5

> Note that the grammar in §5.4 does not use delegation in the first rule for `tree`.
> Give an equivalent linearization grammar using delegation in both rules.

---

The grammar in section 5.4 is as follows:
```text
 tree  ::=  "A"  |  tree "B" ptree
ptree  ::=  "A"  |  "(" tree ")"
```
It seems to us that both rules already use delegation.
(The book should probably give a better explanation of what “delegation” means.)
