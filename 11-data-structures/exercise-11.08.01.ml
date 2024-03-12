(** From the textbook *)

type tree = A | B of tree * tree

module type HEAP = sig
  type address = int
  type index = int
  val alloc : int -> address
  val get : address -> index -> int
  val set : address -> index -> int -> unit
  val release : address -> unit
end

module H : HEAP = struct
  let maxSize = 1000
  let h = Array.make maxSize (-1)
  let s = ref 0 (* current size of heap *)
  exception Address
  exception Full
  type address = int
  type index = int
  let alloc n =
    if n < 1 then raise Address
    else if !s + n > maxSize then raise Full
    else let a = !s in s := !s + n; a
  let check a = if a < 0 || a >= !s then raise Address else a
  let get a i = h.(check (a + i))
  let set a i x = h.(check (a + i)) <- x
  let release a = s := check a
end

let alloc' l =
  let a = H.alloc (List. length l) in
  let rec loop l i =
    match l with
    | [] -> a
    | x :: l -> H.set a i x; loop l (i + 1)
  in loop l 0



(** From a previous exercise. *)

let rec getTree a =
  if a = -1 then A
  else
    let a1 = H.get a 0 in
    let a2 = H.get a 1 in
    B (getTree a1, getTree a2)



(** For this exercise. *)

let rec mtree n =
  if n <= 0 then -1
  else
    let a = mtree (n - 1) in
    alloc' [a; a]

let rec getTree a =
  if a = -1 then A
  else
    let a1 = H.get a 0 in
    let a2 = H.get a 1 in
    if a1 = a2
    then let t = getTree a1 in B (t, t)
    else B (getTree a1, getTree a2)

let rec putTree t = match t with
  | A -> -1
  | B (t1, t2) ->
    if t1 == t2
    then let a = putTree t1 in alloc' [a; a]
    else
      let a1 = putTree t1 in
      let a2 = putTree t2 in
      alloc' [a1; a2]
