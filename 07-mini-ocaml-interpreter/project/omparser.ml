open Omtypes

let verify c l =
  match l with
  | [] -> failwith "verify: no tokens"
  | c' :: l -> if c = c' then l else failwith "verify: wrong token"

(** Types *)

let rec ty l =
  let (t, l) = pty l in ty' t l
and ty' t l = match l with
  | ARR :: l ->
    let (t', l) = pty l in
    let (t'', l) = ty' t' l in
    (Arrow (t, t''), l)
  | _ -> (t, l)
and pty l = match l with
  | BOOL :: l -> (Bool, l)
  | INT :: l -> (Int, l)
  | LP :: l ->
    let (t, l) = ty l in
    let l = verify RP l in
    (t, l)
  | _ -> failwith "pty: wrong token"

(** Expressions *)

let rec exp l = match l with
  | IF :: l ->
    let (e1, l) = exp l in
    let l = verify THEN l in
    let (e2, l) = exp l in
    let l = verify ELSE l in
    let (e3, l) = exp l in
    (If (e1, e2, e3), l)
  | LAM :: VAR x :: ARR :: l ->
    let (e, l) = exp l in
    (Lam (x, e), l)
  | LAM :: LP :: VAR x :: COL :: l ->
    let (t, l) = ty l in
    let l = verify RP l in
    let l = verify ARR l in
    let (e, l) = exp l in
    (Lamty (x, t, e), l)
  | LET :: VAR x :: EQ :: l ->
    let (e1, l) = exp l in
    let l = verify IN l in
    let (e2, l) = exp l in
    (Let (x, e1, e2), l)
  | LET :: REC :: VAR f :: VAR x :: EQ :: l ->
    let (e1, l) = exp l in
    let l = verify IN l in
    let (e2, l) = exp l in
    (Letrec (f, x, e1, e2), l)
  | LET :: REC :: VAR f :: LP :: VAR x :: COL :: l ->
    let (t1, l) = ty l in
    let l = verify RP l in
    let l = verify COL l in
    let (t2, l) = ty l in
    let l = verify EQ l in
    let (e1, l) = exp l in
    let l = verify IN l in
    let (e2, l) = exp l in
    (Letrecty (f, x, t1, t2, e1, e2), l)
  | e -> cexp e
and cexp l =
  let (e, l) = sexp l in cexp' e l
and cexp' e l = match l with
  | LEQ :: l ->
    let (e', l) = sexp l in
    (Oapp (Leq, e, e'), l)
  | _ -> (e, l)
and sexp l =
  let (e, l) = mexp l in sexp' e l
and sexp' e l = match l with
  | ADD :: l ->
    let (e', l) = mexp l in
    sexp' (Oapp (Add, e, e')) l
  | SUB :: l ->
    let (e', l) = mexp l in
    sexp' (Oapp (Sub, e, e')) l
  | _ -> (e, l)
and mexp l =
  let (e, l) = aexp l in mexp' e l
and mexp' e l = match l with
  | MUL :: l ->
    let (e', l) = aexp l in
    mexp' (Oapp (Mul, e, e')) l
  | _ -> (e, l)
and aexp l =
  let (e, l) = pexp l in aexp' e l
and aexp' e l = match l with
  | VAR _ :: _ | CON _ :: _ | LP :: _ ->
    let (e', l) = pexp l in
    aexp' (Fapp (e, e')) l
  | _ -> (e, l)
and pexp l = match l with
  | VAR x :: l -> (Var x, l)
  | CON (BCON b) :: l -> (Con (Bcon b), l)
  | CON (ICON i) :: l -> (Con (Icon i), l)
  | LP :: l ->
    let (e, l) = exp l in
    let l = verify RP l in
    (e, l)
  | _ -> failwith "pexp: wrong prefix token"
