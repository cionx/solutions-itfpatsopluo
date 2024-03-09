(** From the textbook. *)

type tree = A | B of tree * tree



(** For this exercise. *)

let rec mtree n =
  if n = 0 then A
  else
    let m' = mtree (n - 1) in
    B (m', m')

let rec mtree' n t =
  if n = 0 then t else mtree' (n - 1) (B (t, t))



let rec check t =
  match t with
  | A -> Some 0
  | B (t1, t2) ->
    match check t1, check t2 with
    | None, _ | _, None -> None
    | Some n, Some m ->
      if n = m then Some (n + 1) else None
