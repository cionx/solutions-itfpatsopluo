# Exercise 7.5.1

> Give the parsing grammar for Mini-OCaml expressions.

---

We have the following parsing grammar for Mini-OCaml types (as takes from the textbook):
$$
  \begin{aligned}
    ty
    &\Coloneqq
    \mathit{pty} \enspace ty'
    \\
    ty'
    &\Coloneqq
    \texttt{"->"} \enspace \mathit{ty}
    \mid [\,]
    \\
    pty
    &\Coloneqq
    \texttt{"bool"}
    \mid \texttt{"int"}
    \mid \texttt{"("} \enspace \mathit{ty} \enspace \texttt{")"}
  \end{aligned}
$$

We only need to extend the grammar from Exercise 6.6.3 to support type annotations:
$$
  \begin{aligned}
    \mathit{exp}
    \Coloneqq{}&
    \texttt{"if"} \enspace \mathit{exp} \enspace \texttt{"then"} \enspace \mathit{exp} \enspace \texttt{"else"} \enspace \mathit{exp}
    \\
    \mid{}&
    \texttt{"fun"} \enspace \mathit{var} \enspace \texttt{"->"} \enspace \mathit{exp}
    \\
    \mid{}&
    \texttt{"fun"} \enspace \texttt{"("} \enspace \mathit{var} \enspace \texttt{":"} \enspace \mathit{ty} \enspace \texttt{")"} \enspace \texttt{"->"} \enspace \mathit{exp}
    \\
    \mid{}&
    \texttt{"let"} \enspace \mathit{var} \enspace \texttt{"="} \enspace \mathit{exp} \enspace \texttt{"in"} \enspace \mathit{exp}
    \\
    \mid{}&
    \texttt{"let rec"} \enspace \mathit{var} \enspace \mathit{var} \enspace \texttt{"="} \enspace \mathit{exp} \enspace \texttt{"in"} \enspace \mathit{exp}
    \\
    \mid{}&
    \texttt{"let rec"} \enspace \mathit{var} \enspace \texttt{"("} \enspace \mathit{var} \enspace \texttt{":"} \enspace \mathit{ty} \enspace \texttt{")"} \enspace \texttt{":"} \enspace \mathit{ty} \enspace \texttt{"="} \enspace \mathit{exp} \enspace \texttt{"in"} \enspace \mathit{exp}
    \\
    \mid{}&
    \mathit{cexp}
    \\
    \mathit{cexp}
    \Coloneqq{}&
    \mathit{sexp} \enspace \mathit{cexp'}
    \\
    \mathit{cexp'}
    \Coloneqq{}&
    \texttt{"<="} \enspace \mathit{sexp} \mid [\,]
    \\
    \mathit{sexp}
    \Coloneqq{}&
    \mathit{mexp} \enspace \mathit{sexp'}
    \\
    \mathit{sexp'}
    \Coloneqq{}&
    \texttt{"+"} \enspace \mathit{mexp} \enspace \mathit{sexp'}
    \mid \texttt{"-"} \enspace \mathit{mexp} \enspace \mathit{sexp'}
    \mid [\,]
    \\
    \mathit{mexp}
    \Coloneqq{}&
    \mathit{aexp} \enspace \mathit{mexp'}
    \\
    \mathit{mexp'}
    \Coloneqq{}&
    \texttt{"*"} \enspace \mathit{aexp} \enspace \mathit{mexp'}
    \mid [\,]
    \\
    \mathit{aexp}
    \Coloneqq{}&
    \mathit{pexp} \enspace \mathit{aexp'}
    \\
    \mathit{aexp'}
    \Coloneqq{}&
    \mathit{pexp} \enspace \mathit{aexp'}
    \mid [\,]
    \\
    \mathit{pexp}
    \Coloneqq{}&
    \mathit{var} \mid \mathit{con} \mid \texttt{"("} \enspace \mathit{exp} \enspace \texttt{")"}
  \end{aligned}
$$
