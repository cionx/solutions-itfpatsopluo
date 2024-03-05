(** From the textbook. *)

type tree = A | B of tree * tree | C of tree * tree

let rec ctree t = match t with
  | C (t1, t2) -> ctree t1 ^ "C" ^ btree t2
  | t -> btree t
and btree t = match t with
  | B (t1, t2) -> btree t1 ^ "B" ^ ptree t2
  | t -> ptree t
and ptree t = match t with
  | A -> "A"
  | t -> "(" ^ ctree t ^ ")"



(** Part 1. *)

let rec ctree t = match t with
  | C (t1, t2) -> btree t1 ^ "C" ^ ctree t2
  | t -> btree t
and btree t = match t with
  | B (t1, t2) -> ptree t1 ^ "B" ^ btree t2
  | t -> ptree t
and ptree t = match t with
  | A -> "A"
  | t -> "(" ^ ctree t ^ ")"

(** Part 2. *)

let rec ctree t = match t with
  | C (t1, t2) -> ctree t1 ^ "C" ^ btree t2
  | t -> btree t
and btree t = match t with
  | B (t1, t2) -> ptree t1 ^ "B" ^ btree t2
  | t -> ptree t
and ptree t = match t with
  | A -> "A"
  | t -> "(" ^ ctree t ^ ")"

(** Part 3. *)

let rec ctree t = match t with
  | C (t1, t2) -> btree t1 ^ "C" ^ btree t2
  | t -> btree t
and btree t = match t with
  | B (t1, t2) -> ptree t1 ^ "B" ^ ptree t2
  | t -> ptree t
and ptree t = match t with
  | A -> "A"
  | t -> "(" ^ ctree t ^ ")"
