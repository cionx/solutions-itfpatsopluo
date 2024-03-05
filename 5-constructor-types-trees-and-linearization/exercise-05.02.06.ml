(** From the textbook. *)

type tree = A | B of tree * tree



(** For this exercise. *)

let rec mtree n =
  if n = 0 then A else B (A, mtree (n - 1))

let rec mtree' n t =
  if n = 0 then t else mtree' (n - 1) (B (A, t))



let rec check t =
  match t with
  | A -> Some 0
  | B (A, t) | B (t, A) -> begin
    match check t with
    | None -> None
    | Some n -> Some (n + 1)
    end
  | B (B _, B _) -> None
