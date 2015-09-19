(* Wolfram Language package *)

(* ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ *)

(* :Title: Calc																*)

(*
	This software is covered by the GNU Lesser General Public License 3.
	Copyright (C) 1990-2015 Rolf Mertig
	Copyright (C) 1997-2015 Frederik Orellana
	Copyright (C) 2014-2015 Vladyslav Shtabovenko
*)

(* :Summary:  A lot of simplifications in one command					    *)

(* ------------------------------------------------------------------------ *)

Calc::usage =
"Calc[exp] performs several simplifications that involve Contract, DiracSimplify \
SUNSimplify, DotSimplify, EpsEvaluate, ExpandScalarProduct, PowerSimplify, Expand2 \
and Trick.";

(* ------------------------------------------------------------------------ *)

Begin["`Calc`Package`"]
End[]

Begin["`Private`"]

Calc[expr_] :=
	Block[{calc},
		calc[exp_] :=calc[exp] =
			exp//Trick//PowerSimplify//SUNSimplify[#,Explicit->False]&//Explicit//Contract//DiracSimplify//Contract//
			EpsEvaluate//DiracSimplify//DotSimplify//ExpandScalarProduct//PowerSimplify//Expand2;
		FixedPoint[calc,expr, 5]
	];
FCPrint[1,"Calc.m loaded"];
End[]
