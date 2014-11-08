(*
** The prelude for Ardunio
*)

(* ****** ****** *)
//
#define LOW 0x0
#define HIGH 0x1
//
#define INPUT 0x0
#define OUTPUT 0x1
//
(* ****** ****** *)
//
(*
#define PI 3.1415926535897932384626433832795
#define TWO_PI 6.283185307179586476925286766559
#define HALF_PI 1.5707963267948966192313216916398
#define DEG_TO_RAD 0.017453292519943295769236907684886
#define RAD_TO_DEG 57.295779513082320876798154814105
*)
//
macdef PI = $extval(double, "PI")
macdef TWO_PI = $extval(double, "TWO_PI") // 2*PI
macdef HALF_PI = $extval(double, "HALF_PI") // PI/2
macdef DEG_TO_RAD = $extval(double, "DEG_TO_RAD") // PI/180
macdef RAD_TO_DEG = $extval(double, "RAD_TO_DEG") // 180/PI
//
(* ****** ****** *)

typedef pin = natLt(256)

(* ****** ****** *)
//
(*
void pinMode(uint8_t, uint8_t);
*)
fun
pinMode
  (pin: pin, mode: natLt(2)): void = "mac#"
//
(* ****** ****** *)
//
(*
int digitalRead(uint8_t);
void digitalWrite(uint8_t, uint8_t);
*)
fun
digitalRead (pin: pin): natLt(2) = "mac#"
fun
digitalWrite
  (pin: natLt(256), mode: natLt(2)): void = "mac#"
//
(* ****** ****** *)

(*
int analogRead(uint8_t);
void analogWrite(uint8_t, int);
void analogReference(uint8_t mode);
*)

(* ****** ****** *)

fun delay (ms: intGte(0)): void = "mac#"

(* ****** ****** *)

(* end of [Arduion.sats] *)
