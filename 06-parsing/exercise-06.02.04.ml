let balanced s =
  let n = String.length s in
  let rec iter i depth =
    if i >= n then depth = 0
    else if depth < 0 then false
    else match String.get s i with
      | '(' -> iter (i + 1) (depth + 1)
      | ')' -> iter (i + 1) (depth - 1)
      | _ -> failwith "balanced: illegal character"
  in
  iter 0 0
