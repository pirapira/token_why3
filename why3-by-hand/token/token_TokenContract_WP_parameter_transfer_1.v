(* This file is generated by Why3's Coq driver *)
(* Beware! Only edit allowed sections below    *)
Require Import BuiltIn.
Require BuiltIn.
Require int.Int.
Require int.Abs.
Require int.ComputerDivision.
Require map.Map.

(* Why3 assumption *)
Definition unit := unit.

Axiom t : Type.
Parameter t_WhyType : WhyType t.
Existing Instance t_WhyType.

Parameter max: Z.

Parameter to_int: t -> Z.

(* Why3 assumption *)
Definition in_bounds (n:Z): Prop := (0%Z <= n)%Z /\ (n <= max)%Z.

Axiom to_int_in_bounds : forall (n:t), (in_bounds (to_int n)).

Axiom extensionality : forall (x:t) (y:t), ((to_int x) = (to_int y)) ->
  (x = y).

Parameter zero_unsigned: t.

Axiom zero_unsigned_is_zero : ((to_int zero_unsigned) = 0%Z).

Axiom address : Type.
Parameter address_WhyType : WhyType address.
Existing Instance address_WhyType.

Parameter to_int1: address -> Z.

(* Why3 assumption *)
Definition in_bounds1 (n:Z): Prop := (0%Z <= n)%Z /\
  (n <= 1461501637330902918203684832716283019655932542975%Z)%Z.

Axiom to_int_in_bounds1 : forall (n:address), (in_bounds1 (to_int1 n)).

Axiom extensionality1 : forall (x:address) (y:address),
  ((to_int1 x) = (to_int1 y)) -> (x = y).

Parameter zero_unsigned1: address.

Axiom zero_unsigned_is_zero1 : ((to_int1 zero_unsigned1) = 0%Z).

Axiom uint256 : Type.
Parameter uint256_WhyType : WhyType uint256.
Existing Instance uint256_WhyType.

Parameter to_int2: uint256 -> Z.

(* Why3 assumption *)
Definition in_bounds2 (n:Z): Prop := (0%Z <= n)%Z /\
  (n <= 115792089237316195423570985008687907853269984665640564039457584007913129639935%Z)%Z.

Axiom to_int_in_bounds2 : forall (n:uint256), (in_bounds2 (to_int2 n)).

Axiom extensionality2 : forall (x:uint256) (y:uint256),
  ((to_int2 x) = (to_int2 y)) -> (x = y).

Parameter zero_unsigned2: uint256.

Axiom zero_unsigned_is_zero2 : ((to_int2 zero_unsigned2) = 0%Z).

(* Why3 assumption *)
Inductive array (a:Type) :=
  | mk_array : Z -> (map.Map.map Z a) -> array a.
Axiom array_WhyType : forall (a:Type) {a_WT:WhyType a}, WhyType (array a).
Existing Instance array_WhyType.
Implicit Arguments mk_array [[a]].

(* Why3 assumption *)
Definition elts {a:Type} {a_WT:WhyType a} (v:(array a)): (map.Map.map Z a) :=
  match v with
  | (mk_array x x1) => x1
  end.

(* Why3 assumption *)
Definition length {a:Type} {a_WT:WhyType a} (v:(array a)): Z :=
  match v with
  | (mk_array x x1) => x
  end.

(* Why3 assumption *)
Definition get {a:Type} {a_WT:WhyType a} (a1:(array a)) (i:Z): a :=
  (map.Map.get (elts a1) i).

(* Why3 assumption *)
Definition set {a:Type} {a_WT:WhyType a} (a1:(array a)) (i:Z) (v:a): (array
  a) := (mk_array (length a1) (map.Map.set (elts a1) i v)).

(* Why3 goal *)
Theorem WP_parameter_transfer : forall (usfrom:address) (usto:address)
  (usval:uint256) (usorig:Z) (usorig1:(map.Map.map Z uint256)),
  ((0%Z <= usorig)%Z /\ (((to_int1 usto) < usorig)%Z /\
  (((to_int1 usfrom) < usorig)%Z /\
  ((to_int2 usval) <= (to_int2 (map.Map.get usorig1 (to_int1 usto))))%Z))) ->
  let o := (to_int1 usfrom) in (((0%Z <= o)%Z /\ (o < usorig)%Z) ->
  (in_bounds2 ((to_int2 (map.Map.get usorig1 o)) - (to_int2 usval))%Z)).
(* Why3 intros usfrom usto usval usorig usorig1 (h1,(h2,(h3,h4))) o (h5,h6). *)
intros usfrom usto usval usorig usorig1 (h1,(h2,(h3,h4))) o (h5,h6).

Qed.

