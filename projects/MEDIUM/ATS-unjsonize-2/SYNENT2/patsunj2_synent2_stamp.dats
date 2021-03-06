(* ****** ****** *)
//
// ATS-unjsonize-2
//
(* ****** ****** *)
//
(*
** Author: Hongwei Xi
** Authoremail: gmhwxiATgmailDOTcom
** HX-2015-08-07: start
*)
//
(* ****** ****** *)
//
staload
"libats/SATS/hashfun.sats"
staload
_(*anon*) = "libats/DATS/hashfun.dats"
//
(* ****** ****** *)

assume stamp_t0ype = int

(* ****** ****** *)

implement stamp_make(x) = x

(* ****** ****** *)

implement stamp_get_int(x) = x

(* ****** ****** *)

implement
print_stamp(x) = fprint_stamp(stdout_ref, x)

(* ****** ****** *)

implement
fprint_stamp(out, loc) = fprint_int (out, loc)

(* ****** ****** *)
//
implement
hash_stamp(x) =
$UNSAFE.cast{ulint}
  (inthash_jenkins($UNSAFE.cast{uint32}(x)))
//
(* ****** ****** *)
//
implement
eq_stamp_stamp(x1, x2) =
  (compare_stamp_stamp(x1, x2) = 0)
implement
neq_stamp_stamp(x1, x2) =
  (compare_stamp_stamp(x1, x2) != 0)
//
(* ****** ****** *)
//
implement
compare_stamp_stamp(x1, x2) = g0int_compare (x1, x2)
//
(* ****** ****** *)

local
//
var mycnt: stamp = 0
val mycnt =
  ref_make_viewptr{stamp}(view@mycnt | addr@mycnt)
//
in
//
implement
the_stamp_getinc
  ((*void*)) = n0 where
{
  val n0 = mycnt[]
  val () = mycnt[] := n0 + 1
}
//
implement
the_stamp_update
  (n) = let
  val n0 = mycnt[]
in
  if n0 <= n then mycnt[] := n+1
end // end of [the_stamp_update]
//
end // end of [local]

(* ****** ****** *)

(* end of [patsunj2_synent2_stamp.dats] *)
