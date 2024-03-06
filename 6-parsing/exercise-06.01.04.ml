let isdigit c =
  let a = Char.code c in
  48 <= a && a <= 57

let int_of_digit c =
  Char.code c - 48

let islowercase c =
  let a = Char.code c in
  97 <= a && a <= 122

let isuppercase c =
  let a = Char.code c in
  65 <= a && a <= 90
