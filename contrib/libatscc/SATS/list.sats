(*
** libatscc-common
*)

(* ****** ****** *)

(*
staload "./../basics.sats"
*)

(* ****** ****** *)
//
fun{}
list_is_nil
  {a:t0p}{n:int}(list(a, n)): bool(n==0)
fun{}
list_is_cons
  {a:t0p}{n:int}(list(a, n)): bool(n > 0)
//
(* ****** ****** *)
//
fun
list_make_intrange_2
  (l: int, r: int): List0(int) = "mac#%"
fun
list_make_intrange_3
  (l: int, r: int, d: int): List0(int) = "mac#%"
//
symintr list_make_intrange
//
overload
list_make_intrange with list_make_intrange_2
overload
list_make_intrange with list_make_intrange_3
//
(* ****** ****** *)
//
fun{a:t0p}
print_list
  (List(INV(a))): void = "mac#%"
fun{a:t0p}
print_list_sep
  (List(INV(a)), sep: string): void = "mac#%"
//
overload
print with print_list of 100
//
(* ****** ****** *)
//
fun
list_length
  {a:t0p}{n:int}(list(a, n)): int(n) = "mac#%"
//
overload
length with list_length of 100
//
(* ****** ****** *)
//
fun
list_last
  {a:t0p}{n:pos}
  (xs: list(INV(a), n)): (a) = "mac#%"
//
(* ****** ****** *)
//
fun
list_get_at
  {a:t0p}{n:int}
  (list(INV(a), n), natLt(n)): a = "mac#%"
//
overload [] with list_get_at of 100
//
(* ****** ****** *)
//
fun
list_snoc
  {a:t0p}{n:int}
  (list(INV(a), n), x0: a): list(a, n+1)= "mac#%"
//
fun
list_extend
  {a:t0p}{n:int}
  (list(INV(a), n), x0: a): list(a, n+1)= "mac#%"
//
(* ****** ****** *)
//
fun
list_append
  {a:t0p}{i,j:int}
  (list(INV(a), i), list(a, j)): list(a, i+j)= "mac#%"
//
overload + with list_append of 100 // infix
//
(* ****** ****** *)
//
fun
list_reverse
  {a:t0p}{n:int}
  (list(INV(a), n)): list(a, n) = "mac#%"
fun
list_reverse_append
  {a:t0p}{i,j:int}
  (list(a, i), list(INV(a), j)): list(a, i+j) = "mac#%"
//
overload reverse with list_reverse of 100
overload revappend with list_reverse_append of 100
//
(* ****** ****** *)
//
fun
list_take
  {a:t0p}
  {n:int}
  {i:nat | i <= n}
  (xs: list(a, n), i: int(i)): list(a, i) = "mac#%"
fun
list_drop
  {a:t0p}
  {n:int}
  {i:nat | i <= n}
  (xs: list(a, n), i: int(i)): list(a, n-i) = "mac#%"
//
fun
list_split_at
  {a:t0p}
  {n:int}
  {i:nat | i <= n}
  (list(a, n), int(i)): $tup(list(a, i), list(a, n-i)) = "mac#%"
//
(* ****** ****** *)
//
fun
list_insert_at
  {a:t0p}
  {n:int}
  {i:nat | i <= n}
  (list(a, n), int(i), a): list(a, n+1) = "mac#%"
//
fun
list_remove_at
  {a:t0p}
  {n:int}{i:nat | i < n}
  (xs: list(a, n), i: int(i)): list(a, n-1) = "mac#%"
fun
list_takeout_at
  {a:t0p}
  {n:int}{i:nat | i < n}
  (xs: list(a, n), i: int(i)): $tup(a, list(a, n-1)) = "mac#%"
//
(* ****** ****** *)
//
fun
list_exists
  {a:t0p}
  (List(INV(a)), pred: cfun(a, bool)): bool = "mac#%"
fun
list_exists_method
  {a:t0p}
  (List(INV(a)))(pred: cfun(a, bool)): bool = "mac#%"
//
overload .exists with list_exists_method
//
fun
list_iexists
  {a:t0p}
(
  xs: List(INV(a)), pred: cfun(intGte(0), a, bool)
) : bool = "mac#%" // end of [list_iexists]
fun
list_iexists_method
  {a:t0p}
(
  xs: List(INV(a)))(pred: cfun(intGte(0), a, bool)
) : bool = "mac#%" // end of [list_iexists]
//
overload .iexists with list_iexists_method
//
(* ****** ****** *)
//
fun
list_forall
  {a:t0p}
  (List(INV(a)), pred: cfun(a, bool)): bool = "mac#%"
fun
list_forall_method
  {a:t0p}
  (List(INV(a)))(pred: cfun(a, bool)): bool = "mac#%"
//
overload .forall with list_forall_method
//
fun
list_iforall
  {a:t0p}
(
  xs: List(INV(a)), pred: cfun(intGte(0), a, bool)
) : bool = "mac#%" // end of [list_iforall]
fun
list_iforall_method
  {a:t0p}
(
  xs: List(INV(a)))(pred: cfun(intGte(0), a, bool)
) : bool = "mac#%" // end of [list_iforall]
//
overload .iforall with list_iforall_method
//
(* ****** ****** *)
//
fun
list_app
  {a:t0p}
  (List(INV(a)), fwork: cfun(a, void)): void = "mac#%"
fun
list_foreach
  {a:t0p}
  (List(INV(a)), fwork: cfun(a, void)): void = "mac#%"
//
fun
list_foreach_method
  {a:t0p}
  (List(INV(a)))(fwork: cfun(a, void)): void = "mac#%"
//
overload .foreach with list_foreach_method
//
(* ****** ****** *)
//
fun
list_iforeach
  {a:t0p}
  (xs: List(INV(a)), fwork: cfun(int, a, void)): void = "mac#%"
fun
list_iforeach_method
  {a:t0p}
  (xs: List(INV(a)))(fwork: cfun(int, a, void)): void = "mac#%"
//
overload .iforeach with list_iforeach_method
//
(* ****** ****** *)
//
fun
list_rforeach
  {a:t0p}
  (xs: List(INV(a)), fwork: cfun(a, void)): void = "mac#%"
fun
list_rforeach_method
  {a:t0p}
  (xs: List(INV(a)))(fwork: cfun(a, void)): void = "mac#%"
//
(* ****** ****** *)
//
fun
list_filter
  {a:t0p}{n:int}
  (list(INV(a), n), p: cfun(a, bool)): listLte(a, n) = "mac#%"
//
(* ****** ****** *)
//
fun
list_map
  {a:t0p}{b:t0p}{n:int}
  (xs: list(INV(a), n), fopr: cfun(a, b)): list(b, n) = "mac#%"
//
(* ****** ****** *)
//
fun
list_foldleft
  {res:vt0p}{a:t0p}
  (List(INV(a)), init: res, fopr: (res, a) -<cloref1> res): res = "mac#%"
fun
list_foldright
  {a:t0p}{res:vt0p}
  (List(INV(a)), fopr: (a, res) -<cloref1> res, sink: res): res = "mac#%"
//
(* ****** ****** *)

(* end of [list.sats] *)
