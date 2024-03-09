(** From the textbook. *)

type tree = A | B of tree * tree | C of tree * tree



(** For this exercise. *)

let rec tree t = match t with
  | A | B _ -> btree t (* we can process A with either btree or ctree *)
  | C _ -> ctree t
and btree t = match t with
  | B (t1, t2) -> tree t1 ^ "B" ^ ptree t2
  | _ -> ptree t
and ctree t = match t with
  | C (t1, t2) -> tree t1 ^ "C" ^ ptree t2
  | _ -> ptree t
and ptree t = match t with
  | A -> "A"
  | t -> "(" ^ tree t ^ ")"
