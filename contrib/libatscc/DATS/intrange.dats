(*
** libatscc-common
*)

(* ****** ****** *)

(*
staload "./../basics.sats"
staload "./../SATS/intrange.sats"
*)

(* ****** ****** *)
//
implement
int_repeat_lazy
  (n, f) =
  int_repeat_cloref (n, lazy2cloref(f))
//
(* ****** ****** *)

implement
int_repeat_cloref
  (n, f) = let
//
fun
loop
(
  n: int, f: cfun0(void)
) : void = (
//
if n > 0
  then let val () = f () in loop (n-1, f) end
  else ()
//
) (* end of [loop] *)
//
in
  loop (n, f)
end // end of [int_repeat_cloref]

(* ****** ****** *)
//
implement
int_exists_cloref
  (n, f) =
(
  intrange_exists_cloref (0, n, f)
)
implement
int_forall_cloref
  (n, f) =
(
  intrange_forall_cloref (0, n, f)
)
//
implement
int_foreach_cloref
  (n, f) =
(
  intrange_foreach_cloref (0, n, f)
)
//
(* ****** ****** *)
//
implement
int2_exists_cloref
  (n1, n2, f) =
(
  intrange2_exists_cloref (0, n1, 0, n2, f)
)
implement
int2_forall_cloref
  (n1, n2, f) =
(
  intrange2_forall_cloref (0, n1, 0, n2, f)
)
//
implement
int2_foreach_cloref
  (n1, n2, f) =
(
  intrange2_foreach_cloref (0, n1, 0, n2, f)
)
//
(* ****** ****** *)

implement
intrange_exists_cloref
  (l, r, f) = let
//
fun
loop
(
  l: int, r: int, f: cfun1(int, bool)
) : bool = (
//
if l < r
  then (
    if f (l) then true else loop (l+1, r, f)
  ) else false
//
) (* end of [loop] *)
//
in
  loop (l, r, f)
end // end of [intrange_exists_cloref]

(* ****** ****** *)

implement
intrange_forall_cloref
  (l, r, f) = let
//
fun
loop
(
  l: int, r: int, f: cfun1(int, bool)
) : bool = (
//
if l < r
  then (
    if f (l) then loop (l+1, r, f) else false
  ) else true
//
) (* end of [loop] *)
//
in
  loop (l, r, f)
end // end of [intrange_forall_cloref]

(* ****** ****** *)

implement
intrange_foreach_cloref
  (l, r, f) = let
//
fun
loop
(
  l: int, r: int, f: cfun1(int, void)
) : void = (
//
if l < r
  then let val () = f (l) in loop (l+1, r, f) end
  else ()
//
) (* end of [loop] *)
//
in
  loop (l, r, f)
end // end of [intrange_foreach_cloref]

(* ****** ****** *)

implement
intrange2_exists_cloref
  (l1, r1, l2, r2, f) = let
//
fnx
loop1
(
  l1: int, r1: int
, f: cfun2 (int, int, bool)
) : bool = (
//
if l1 < r1
  then loop2 (l1, r1, l2, r2, f) else false
//
) (* end of [loop1] *)
//
and
loop2
(
  l1: int, r1: int
, l2: int, r2: int
, f: cfun2 (int, int, bool)
) : bool = (
//
if l2 < r2
  then (
    if f (l1, l2)
      then true else loop2 (l1, r1, l2+1, r2, f)
    // end of [if]
  ) else loop1 (l1+1, r1, f)
//
) (* end of [loop2] *)
//
in
  loop1 (l1, r1, f)
end // end of [intrange2_exists_cloref]

(* ****** ****** *)

implement
intrange2_forall_cloref
  (l1, r1, l2, r2, f) = let
//
fnx
loop1
(
  l1: int, r1: int
, f: cfun2 (int, int, bool)
) : bool = (
//
if l1 < r1
  then loop2 (l1, r1, l2, r2, f) else true
//
) (* end of [loop1] *)
//
and
loop2
(
  l1: int, r1: int
, l2: int, r2: int
, f: cfun2 (int, int, bool)
) : bool = (
//
if l2 < r2
  then (
    if f (l1, l2)
      then loop2 (l1, r1, l2+1, r2, f) else false
    // end of [if]
  ) else loop1 (l1+1, r1, f)
//
) (* end of [loop2] *)
//
in
  loop1 (l1, r1, f)
end // end of [intrange2_forall_cloref]

(* ****** ****** *)

implement
intrange2_foreach_cloref
  (l1, r1, l2, r2, f) = let
//
fnx
loop1
(
  l1: int, r1: int
, f: cfun2 (int, int, void)
) : void = (
//
if l1 < r1
  then loop2 (l1, r1, l2, r2, f) else ()
//
) (* end of [loop1] *)
//
and
loop2
(
  l1: int, r1: int
, l2: int, r2: int
, f: cfun2 (int, int, void)
) : void = (
//
if l2 < r2
  then (
    f (l1, l2); loop2 (l1, r1, l2+1, r2, f)
  ) else loop1 (l1+1, r1, f)
//
) (* end of [loop2] *)
//
in
  loop1 (l1, r1, f)
end // end of [intrange2_foreach_cloref]

(* ****** ****** *)

(* end of [intrange.dats] *)
