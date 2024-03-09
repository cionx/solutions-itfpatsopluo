# Linearization grammars

## Types

We have the following linearization grammar for types:
$$
  \begin{aligned}
    \mathit{ty}
    &\Coloneqq
    \mathit{pty} \enspace \texttt{"->"} \enspace \mathit{ty}
    \mid \mathit{pty}
    \\
    \mathit{pty}
    &\Coloneqq
    \mathit{int}
    \mid \mathit{bool}
    \mid \texttt{"("} \enspace \mathit{ty} \enspace \texttt{")"}
  \end{aligned}
$$

## Expressions

For expressions, we start with the linearization grammar from Exercise 6.6.3:
$$
  \begin{aligned}
    \mathit{exp} \Coloneqq{}& \texttt{"if"} \enspace \mathit{exp} \enspace \texttt{"then"} \enspace \mathit{exp} \enspace \texttt{"else"} \enspace \mathit{exp} \\
    \mid{}& \texttt{"fun"} \enspace \mathit{var} \enspace \texttt{"->"} \enspace \mathit{exp} \\
    \mid{}& \texttt{"let"} \enspace \mathit{var} \enspace \texttt{"="} \enspace \mathit{exp} \enspace \texttt{"in"} \enspace \mathit{exp} \\
    \mid{}& \texttt{"let rec"} \enspace \mathit{var} \enspace \mathit{var} \enspace \texttt{"="} \enspace \mathit{exp} \enspace \texttt{"in"} \enspace \mathit{exp} \\
    \mid{}& \mathit{cexp} \\
    \mathit{cexp} \Coloneqq{}& \mathit{sexp} \enspace \texttt{"<="} \enspace \mathit{sexp} \mid \mathit{sexp} \\
    \mathit{sexp} \Coloneqq{}& \mathit{sexp} \enspace \texttt{"+"} \enspace \mathit{mexp} \mid \mathit{sexp} \enspace \texttt{"-"} \enspace \mathit{mexp} \mid \mathit{mexp} \\
    \mathit{mexp} \Coloneqq{}& \mathit{mexp} \enspace \texttt{"*"} \enspace \mathit{aexp} \mid \mathit{aexp} \\
    \mathit{aexp} \Coloneqq{}& \mathit{aexp} \enspace \mathit{pexp} \mid \mathit{pexp} \\
    \mathit{pexp} \Coloneqq{}& \mathit{var} \mid \mathit{con} \mid \texttt{"("} \enspace \mathit{exp} \enspace \texttt{")"}
  \end{aligned}
$$
We extend this grammar by typed lambda expressions and typed let-rec expressions:
$$
  \begin{aligned}
    \mathit{exp} \Coloneqq{}& \cdots \\
    \mid{}& \texttt{"fun"} \enspace \mathit{var} \enspace \texttt{"->"} \enspace \mathit{exp} \\
    \mid{}& \texttt{"fun"} \enspace \texttt{"("} \enspace \mathit{var} \enspace \texttt{":"} \enspace \mathit{ty} \enspace \texttt{")"} \enspace \texttt{"->"} \enspace \mathit{exp} \\
    \mid{}& \cdots \\
    \mid{}& \texttt{"let rec"} \enspace \mathit{var} \enspace \mathit{var} \enspace \texttt{"="} \enspace \mathit{exp} \enspace \texttt{"in"} \enspace \mathit{exp} \\
    \mid{}& \texttt{"let rec"} \enspace \mathit{var} \enspace \texttt{"("} \enspace \mathit{var} \enspace \texttt{":"} \enspace \mathit{ty} \enspace \texttt{")"} \enspace \texttt{":"} \enspace \mathit{ty} \enspace \texttt{"="} \enspace \mathit{exp} \enspace \texttt{"in"} \enspace \mathit{exp} \\
    \mid{}& \cdots
  \end{aligned}
$$

## Values and value environments

```ocaml
type value =
  | Bval of bool
  | Ival of int
  | Closure of var * exp * (var, value) env
  | Rclosure of var * var * exp * (var, value) env
```
For values, we use the following linearization grammar:
$$
  \begin{aligned}
    \mathit{val}
    \Coloneqq{}&
    \mathit{int}
    \mid
    \mathit{bool}
    \\
    \mid{}&
    \texttt{"("} \enspace \mathit{var} \enspace \texttt{","} \enspace \mathit{exp} \enspace \texttt{","} \enspace \mathit{env} \enspace \texttt{")"}
    \\
    \mid{}&
    \texttt{"("} \enspace \mathit{var} \enspace \texttt{","} \enspace \mathit{var} \enspace \texttt{","} \enspace \mathit{exp} \enspace \texttt{","} \enspace \mathit{env} \enspace \texttt{")"}
  \end{aligned}
$$

For environments, we will use OCaml linearization.
