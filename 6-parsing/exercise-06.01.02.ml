type tree = A | B of tree * tree | C of tree * tree

type token = AT | BT | CT | LP | RP

(**
let lex s =
  let n = String.length s in
  let rec lex' i l cdepth =
    if i >= n then List.rev l
    (** if we already are inside a comment *)
    else if cdepth > 0 then
      if i < n - 1 then
        match String.get s i, String.get s (i + 1) with
        | '(', '*' -> lex' (i + 2) l (cdepth + 1)
        | ')', '*' -> lex' (i + 2) l (cdepth - 1)
        | _ -> lex' (i + 1) l cdepth
      else lex' (i + 1) l cdepth
    (** if we are outside any comment *)
    else match String.get s i with
      | 'A' -> lex' (i + 1) (AT :: l) 0
      | 'B' -> lex' (i + 1) (BT :: l) 0
      | 'C' -> lex' (i + 1) (CT :: l) 0
      | '(' ->
        begin
          if i < n - 1 && String.get s (i + 1) = '*'
          then lex' (i + 2) l 1
          else lex' (i + 1) (LP :: l) 0
        end
      | ')' -> lex' (i + 1) (RP :: l) 0
      | ' ' | '\n' | '\t' -> lex' (i + 1) l 0
      | _ -> failwith "lex: illegal character"
  in lex' 0 [] 0
*)

let lex s =
  let n = String.length s in
  let token_of_char c =
    match c with
    | 'A' -> AT
    | 'B' -> BT
    | 'C' -> CT
    | '(' -> LP
    | ')' -> RP
    | _ -> failwith "lex: illegal character"
  in
  let rec lex' i l cdepth =
    let process_char c =
      match c with
      | ' ' | '\n' | '\t' -> lex' (i + 1) l cdepth
      | c -> lex' (i + 1)
        (if cdepth > 0 then l else token_of_char c :: l)
        cdepth
    in
    (** no characters left *)
    if i >= n then List.rev l
    (** at least two characters left *)
    else if i < n - 1 then begin
      match String.get s i, String.get s (i + 1) with
      | '(', '*' -> lex' (i + 2) l (cdepth + 1)
      | '*', ')' when cdepth > 0 -> lex' (i + 2) l (cdepth - 1)
      | c, _ -> process_char c
      end
    (** exactly one character left *)
    else process_char (String.get s i)
  in
  lex' 0 [] 0
