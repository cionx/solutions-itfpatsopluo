(** From the textbook. *)

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

(** [getclist n a] are the first [n] entries of a circular list saved at [a]. *)
let rec getclist n a =
  if n <= 0 then []
  else H.get a 0 :: getclist (n - 1) (H.get a 1)



(** For this exercise. *)

let putclist l =
  let rec loop l = match l with
    | [] -> invalid_arg "putclist: empty list"
    | [x] ->
      let a = alloc' [x; -1] in (a, a)
    | x :: l ->
      let (first, last) = loop l in
      let newfirst = alloc' [x; first] in
      (newfirst, last)
  in
  let (first, last) = loop l in
  H.set last 1 first;
  first

let repeat n =
  putclist (List.init n (fun i -> i + 1))
