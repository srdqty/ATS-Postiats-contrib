(* ****** ****** *)
//
// ATS-parse-emit
//
(* ****** ****** *)
//
// HX-2014-07-02: start
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload "./atsparemit.sats"

(* ****** ****** *)

staload
FIL = {
//
#include
"share/atspre_define.hats"
//
staload "./atsparemit.sats"
//
typedef T = fil_t
//
#include "{$LIBATSHWXI}/globals/HATS/gstacklst.hats"
//
implement
the_filename_pop () = pop_exn ()
implement
the_filename_push (fil) = push (fil)
//
implement
the_filename_get () = get_top_exn ()
//
} (* end of [staload] *)

(* ****** ****** *)

val () = the_filename_push (filename_dummy)

(* ****** ****** *)

staload
LEXERR = {
//
#include
"share/atspre_define.hats"
//
staload "./atsparemit.sats"
//
typedef T = lexerr
//
#include "{$LIBATSHWXI}/globals/HATS/gstacklst.hats"
//
implement
the_lexerrlst_insert (x) = push (x)
//
implement
the_lexerrlst_pop_all () = pop_all ()
//
} (* end of [staload] *)

(* ****** ****** *)

staload
PARERR = {
//
#include
"share/atspre_define.hats"
//
staload "./atsparemit.sats"
//
typedef T = parerr
//
#include "{$LIBATSHWXI}/globals/HATS/gstacklst.hats"
//
implement
the_parerrlst_insert (x) = push (x)
//
implement
the_parerrlst_pop_all () = pop_all ()
//
} (* end of [staload] *)

(* ****** ****** *)

staload KWORD =
{
//
#include
"share/atspre_define.hats"
//
staload "./atsparemit.sats"
//
typedef key = string
typedef itm = keyword
//
#define CAPACITY 1024
//
//
staload
"libats/SATS/hashtbl_linprb.sats"
//
implement hashtbl$recapacitize<> () = 0
//
#include "{$LIBATSHWXI}/globals/HATS/ghashtbl_linprb.hats"
//
} (* end of [staload] *)

(* ****** ****** *)

val () =
{
//
macdef
kwordins (name, kw) =
  $KWORD.insert_opt (,(name), ,(kw))
//
val-~None_vt() = kwordins ("ATStmpdec", ATStmpdec)
//
val-~None_vt() = kwordins ("ATSif", ATSif)
val-~None_vt() = kwordins ("ATSthen", ATSthen)
val-~None_vt() = kwordins ("ATSelse", ATSelse)
//
val-~None_vt() = kwordins ("ATSgoto", ATSgoto)
//
val-~None_vt() = kwordins ("ATSreturn", ATSreturn)
val-~None_vt() = kwordins ("ATSreturn_void", ATSreturn_void)
//
val-~None_vt() = kwordins ("ATStailcalbeg", ATStailcalbeg)
val-~None_vt() = kwordins ("ATStailcalend", ATStailcalend)
//
val-~None_vt() = kwordins ("ATSINSmove", ATSINSmove)
//
val-~None_vt() = kwordins ("ATSINSmove_boxrec", ATSINSmove_boxrec)
val-~None_vt() = kwordins ("ATSINSmove_boxrec_ofs", ATSINSmove_boxrec_ofs)
//
val-~None_vt() = kwordins ("ATSSELboxrec", ATSSELboxrec)
val-~None_vt() = kwordins ("ATSSELfltrec", ATSSELfltrec)
//
val-~None_vt() = kwordins ("ATSINSstore_boxrec_ofs", ATSINSstore_boxrec_ofs)
val-~None_vt() = kwordins ("ATSINSstore_fltrec_ofs", ATSINSstore_fltrec_ofs)
//
val-~None_vt() = kwordins ("ATSINSmove_tlcal", ATSINSmove_tlcal)
val-~None_vt() = kwordins ("ATSINSargmove_tlcal", ATSINSargmove_tlcal)
//
val-~None_vt() = kwordins ("ATSPMVi0nt", ATSPMVi0nt)
val-~None_vt() = kwordins ("ATSPMVf0loat", ATSPMVf0loat)
//
val-~None_vt() = kwordins ("ATSinline", ATSinline)
val-~None_vt() = kwordins ("ATSglobaldec", ATSglobaldec)
val-~None_vt() = kwordins ("ATSstaticdec", ATSstaticdec)
//
val-~None_vt() = kwordins ("ATSdyncst_mac", ATSdyncst_mac)
val-~None_vt() = kwordins ("ATSdyncst_extfun", ATSdyncst_extfun)
//
val-~None_vt() = kwordins ("#if", SRPif)
val-~None_vt() = kwordins ("#ifdef", SRPifdef)
val-~None_vt() = kwordins ("#ifndef", SRPifndef)
val-~None_vt() = kwordins ("#include", SRPinclude)
//
} (* end of [val] *)

(* ****** ****** *)

implement
keyword_search
  (name) = let
//
val cp = $KWORD.search_ref (name)
//
in
//
if isneqz(cp)
  then $UNSAFE.cptr_get<keyword> (cp) else KWnone()
//
end // end of [keyword_search]

(* ****** ****** *)

(* end of [atsparemit_global.dats] *)
