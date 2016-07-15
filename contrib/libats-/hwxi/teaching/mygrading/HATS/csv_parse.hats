(* ****** ****** *)
//
// Author: Hongwei Xi
// Authoremail: gmhwxiATgmailDOTcom
// Start time: the first of July, 2016
//
(* ****** ****** *)
//
#ifdef
MYGRADING_HATS
#then
#else
//
extern
fun
csv_parse_line
(
  line: string
) : List0_vt(Strptr1)
//
#endif // #ifdef
//
(* ****** ****** *)

local
//
staload
UN = "prelude/SATS/unsafe.sats"
//
extern
fun{}
getpos(): int
//
extern
fun{}
is_end(): bool
//
extern
fun{}
char_at(): int
//
extern
fun{}
Strptr1_at(i0: int): Strptr1
//
extern
fun{}
rmove(): void
extern
fun{}
rmove_while(test: char -<cloref1> bool): void
//
in (* in-of-local *)
//
implement
{}(*tmp*)
rmove_while
  (test) = let
//
val c0 = char_at()
//
in
//
if c0 >= 0 then
  if test(int2char0(c0)) then (rmove(); rmove_while(test)) else ()
// end of [if]
//
end // end of [rmove_while]

(* ****** ****** *)

implement
csv_parse_line
  (line) = let
//
val line = g1ofg0(line)
//
var i: int = 0
val p_i = addr@i
//
val n0 = sz2i(length(line))
//
macdef get_i() = $UN.ptr0_get<int>(p_i)
macdef inc_i() = $UN.ptr0_addby<int>(p_i, 1)
macdef set_i(i0) = $UN.ptr0_set<int>(p_i, ,(i0))
//
implement
getpos<>() = get_i()
//
implement
is_end<>() = get_i() >= n0
//
implement
char_at<>() = let
  val i = get_i()
  val i = ckastloc_gintGte(i, 0)
//
in
  if i < n0 then char2u2int0(line[i]) else ~1
end // end of [char_at]
//
implement
Strptr1_at<>(i0) = let
//
  val i1 = get_i()
  val i0 = ckastloc_gintGte(i0, 0)
  val i1 = ckastloc_gintBtwe(i1, i0, n0)
//
in
  $UN.castvwtp0(
    string_make_substring(line, i2sz(i0), i2sz(i1-i0))
  ) (* $UN.castvwtp0 *)
end // end of [Strptr1_at]
//
implement
rmove<>() =
  if get_i() < n0 then inc_i()
//
vtypedef res_vt = List0_vt(Strptr1)
//
fun
loop
(
  i: int, res: res_vt
) : res_vt =
if
is_end()
then res
else let
  val () =
  (
    if i > 0 then rmove()
  )
  val i0 = getpos()
  var f0 =
  (
    lam@(c: char) =<clo> c != ','
  )
  val () = rmove_while($UN.cast(addr@f0))
  val s0 = Strptr1_at(i0)
in
  loop(i+1, list_vt_cons(s0, res))
end // end of [else]
//
in
  list_vt_reverse(loop(0(*i*), list_vt_nil((*void*))))
end // end of [csv_parse_line]

end // end of [local]

(* ****** ****** *)

(* end of [csv_parse.hats] *)