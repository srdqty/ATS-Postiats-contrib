(*
** ATS-extsolve:
** For solving ATS-constraints
** with external SMT-solvers
*)

(* ****** ****** *)

(*
** Author: Hongwei Xi
** Authoremail: gmhwxiATgmailDOTcom
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
staload
UN = "prelude/SATS/unsafe.sats"
//
staload "./patsolve_cnstrnt.sats"
//
(* ****** ****** *)

typedef
s2cst_struct = @{
  s2cst_srt= s2rt
, s2cst_name= symbol
, s2cst_stamp= stamp
, s2cst_supcls= List0 (s2exp)
} (* end of [s2cst_struct] *)

(* ****** ****** *)

local
//
assume
s2cst_type =
  ref (s2cst_struct)
//
in (* in of [local] *)

implement
s2cst_make
  (srt, name, stamp) = let
//
val [l:addr] (
  pfat, pfgc | p
) = ptr_alloc<s2cst_struct> ()
//
val () = p->s2cst_srt := srt
val () = p->s2cst_name := name
val () = p->s2cst_stamp := stamp
val () = p->s2cst_supcls := list_nil ()
//
in
  $UN.castvwtp0{s2cst}((pfat, pfgc | p))
end // end of [s2cst_make]

(* ****** ****** *)
//
implement
s2cst_get_srt (s2c) = !s2c.s2cst_srt
//
implement
s2cst_get_name (s2c) = !s2c.s2cst_name
implement
s2cst_get_stamp (s2c) = !s2c.s2cst_stamp
//
(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

implement
fprint_s2cst
  (out, s2c) =
  fprint! (out, s2c.name(), "(", s2c.stamp(), ")")
// end of [fprint_s2cst]

(* ****** ****** *)

(* end of [patsolve_cnstrnt_s2cst.dats] *)
