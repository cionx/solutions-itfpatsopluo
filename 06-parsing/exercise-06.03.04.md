# Exercise 6.3.4

> After having seen the simplified grammar for right-associativity, Dieter Schlau gets excited and finally comes up with a simplified grammar he claims works for left-associativity:
> ```t
> tree ::=  ptree  |  tree "B" ptree
> ```
> Explain why Dieter’s grammar cannot be realized with parsing functions.

---

We have altogether the following grammar:
```text
 tree  ::=  ptree  |  tree "B" ptree
ptree  ::= "A"  |  "(" tree ")"
```

The textbook hasn’t explained what it means for parsing functions to “realize” a grammar, so we can’t give an actual explanation.

Intuitively speaking, to evaluate `tree l`, we need to decide which of the two rules for `tree` to apply:
`ptree` or `tree "B" ptree`.
However, we cannot decide this by only looking at a fixed number of leading tokens of `l`.
