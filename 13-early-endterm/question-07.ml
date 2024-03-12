let swap arr i j =
  let tmp = arr.(i) in arr.(i) <- arr.(j); arr.(j) <- tmp

let rev arr =
  let rec loop i j =
    if i > j then ()
    else begin
      swap arr i j;
      loop (i + 1) (j - 1)
      end
  in
  loop 0 (Array.length arr - 1)
