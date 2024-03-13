let rotate arr =
  let n = Array.length arr in
  let rec loop i =
    if i <= 0 then ()
    else begin
      arr.(i) <- arr.(i - 1);
      loop (i - 1)
      end
  in
  if n = 0 then ()
  else
    let last = arr.(n - 1) in
    loop (n - 1);
    arr.(0) <- last;
    ()
