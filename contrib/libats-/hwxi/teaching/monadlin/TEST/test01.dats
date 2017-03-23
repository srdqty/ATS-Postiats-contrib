(*
** PlayGame
** from a Haskell source
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)
//
#include
"./../DATS/monadlin_state.dats"
//
(* ****** ****** *)
//
typedef GameValue = int
typedef GameState = bool
//
datavtype state =
  | STATE of (GameState)
//
(* ****** ****** *)

assume state_vtype = state

(* ****** ****** *)

implement
{}(*tmp*)
state_create() = STATE(false)

(* ****** ****** *)

implement
{}(*tmp*)
state_destroy(st) = { val-~STATE _ = st }

(* ****** ****** *)
//
extern
fun
PlayChar
  (c0: char): GameValue -<cloref1> M(GameValue)
//
extern
fun
PlayGame(cs: list0(char)): M(GameValue)
//
(* ****** ****** *)
//
implement
PlayChar
(
  c0
) = lam(v0) => let
//
reassume stmonad_vtype
//
in
//
case c0 of
| 'a' =>
  (
  llam (s) =>
    let val+STATE(b) = s in (s, if(b)then(v0+1)else(v0)) end
  // end of [llam]
  )
| 'b' =>
  (
  llam (s) =>
    let val+STATE(b) = s in (s, if(b)then(v0-1)else(v0)) end
  // end of [llam]
  )
| 'c' =>
  (
  llam (s) =>
    let val+@STATE(b) = s in b := not(b); fold@(s); (s, v0) end
  // end of [lam]
  )
| _(*rest*) => llam(s) => (s, v0)
//
end // end of [PlayChar]
//
(* ****** ****** *)
//
implement
PlayGame(cs) = let
//
reassume stmonad_vtype
//
fun
aux
(
cs: list0(char), mx: M(GameValue)
) : M(GameValue) =
//
case+ cs of
| list0_nil() => mx
| list0_cons(c, cs) => aux(cs, stmonad_bind<GameValue><GameValue>(mx, PlayChar(c)))
  //
in
  aux(cs, stmonad_return<GameValue>(0))
end // end of [PlayGame]

(* ****** ****** *)

implement
main0() =
{
//
val cs =
$list{char}
  ('c', 'a', 'b', 'a', 'c', 'd', 'a', 'b')
//
val cs = g0ofg1_list(cs)
//
val s0 = state_create((*void*))
val (sz, vz) =
  stmonad_runState<GameValue>(PlayGame(cs), s0)
//
val+~STATE(b) = sz
//
val () =
  list_vt_free($UN.castvwtp0{List0_vt(char)}(cs))
//
val () =
  println! ("The final state = (", b, ", ", vz, ")")
//
} (* end of [val] *)

(* ****** ****** *)

(* end of [test01.dats] *)
