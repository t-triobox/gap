#############################################################################
##
#W  algebra.gd                  GAP library                     Thomas Breuer
##
#H  @(#)$Id$
##
#Y  Copyright (C)  1997,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file declares the operations for 'FLMLOR's and algebras.
##
Revision.algebra_gd :=
    "@(#)$Id$";


#############################################################################
##
#C  IsFLMLOR( <obj> )
##
##  A FLMLOR in {\GAP} is a ring that is also a free left module.
##  Examples are magma rings (e.g. over the integers) or algebras.
##
IsFLMLOR := IsFreeLeftModule and IsLeftOperatorRing;


#############################################################################
##
#C  IsFLMLORWithOne( <obj> )
##
##  A FLMLOR-with-one in {\GAP} is a ring-with-one that is also a free left
##  module.
##  Examples are magma rings-with-one or algebras-with-one (but also over the
##  integers).
##
IsFLMLORWithOne := IsFreeLeftModule and IsLeftOperatorRingWithOne;


#############################################################################
##
#C  IsAlgebra( <obj> )
##
##  An algebra in {\GAP} is a ring that is also a left vector space.
##  Note that this means that being an algebra is not a property a ring can
##  get, since a ring is usually not represented as an external left set.
##
IsAlgebra := IsLeftVectorSpace and IsLeftOperatorRing;


#############################################################################
##
#C  IsAlgebraWithOne( <obj> )
##
##  A algebra-with-one in {\GAP} is a ring-with-one that is also
##  a left vector space.
##  Note that this means that being an algebra-with-one is not a property a
##  ring-with-one can get,
##  since a ring-with-one is usually not represented as an external left set.
##
IsAlgebraWithOne := IsLeftVectorSpace and IsLeftOperatorRingWithOne;


#############################################################################
##
#P  IsLieAlgebra( <A> )
##
##  An algebra <A> is called Lie algebra if $a * a = 0$ for all $a$ in <A>
##  and $( a * ( b * c ) ) + ( b * ( c * a ) ) + ( c * ( a * b ) ) = 0$
##  for all $a, b, c$ in <A> (Jacobi identity).
##
IsLieAlgebra := IsAlgebra and IsZeroSquaredRing and IsJacobianRing;
SetIsLieAlgebra := Setter( IsLieAlgebra );
HasIsLieAlgebra := Tester( IsLieAlgebra );


#############################################################################
##
#P  IsSimpleAlgebra( <L> )
##
##  is 'true' if the algebra <L> is simple, and 'false' otherwise.
##
IsSimpleAlgebra := NewProperty( "IsSimpleAlgebra", IsAlgebra );
SetIsSimpleAlgebra := Setter( IsSimpleAlgebra );
HasIsSimpleAlgebra := Tester( IsSimpleAlgebra );


#############################################################################
##
#A  GeneratorsOfLeftOperatorRing
##
GeneratorsOfLeftOperatorRing := NewAttribute(
    "GeneratorsOfLeftOperatorRing", IsLeftOperatorRing );
SetGeneratorsOfLeftOperatorRing := Setter( GeneratorsOfLeftOperatorRing );
HasGeneratorsOfLeftOperatorRing := Tester( GeneratorsOfLeftOperatorRing );


#############################################################################
##
#A  GeneratorsOfLeftOperatorRingWithOne
##
GeneratorsOfLeftOperatorRingWithOne := NewAttribute(
    "GeneratorsOfLeftOperatorRingWithOne", IsLeftOperatorRingWithOne );
SetGeneratorsOfLeftOperatorRingWithOne := Setter(
    GeneratorsOfLeftOperatorRingWithOne );
HasGeneratorsOfLeftOperatorRingWithOne := Tester(
    GeneratorsOfLeftOperatorRingWithOne );


#############################################################################
##
#A  GeneratorsOfAlgebra( <A> )
##
GeneratorsOfAlgebra := GeneratorsOfLeftOperatorRing;
SetGeneratorsOfAlgebra := SetGeneratorsOfLeftOperatorRing;
HasGeneratorsOfAlgebra := HasGeneratorsOfLeftOperatorRing;


#############################################################################
##
#A  GeneratorsOfAlgebraWithOne( <A> )
##
GeneratorsOfAlgebraWithOne := GeneratorsOfLeftOperatorRingWithOne;
SetGeneratorsOfAlgebraWithOne := SetGeneratorsOfLeftOperatorRingWithOne;
HasGeneratorsOfAlgebraWithOne := HasGeneratorsOfLeftOperatorRingWithOne;


#############################################################################
##
#A  DerivedSeriesOfAlgebra( <A> )
##
DerivedSeriesOfAlgebra := NewAttribute( "DerivedSeriesOfAlgebra",
    IsAlgebra );
SetDerivedSeriesOfAlgebra := Setter( DerivedSeriesOfAlgebra );
HasDerivedSeriesOfAlgebra := Tester( DerivedSeriesOfAlgebra );


#############################################################################
##
#A  DerivedSubalgebra( <A> )
##
DerivedSubalgebra := NewAttribute( "DerivedSubalgebra", IsAlgebra );
SetDerivedSubalgebra := Setter( DerivedSubalgebra );
HasDerivedSubalgebra := Tester( DerivedSubalgebra );


#############################################################################
##
#A  AdjointBasis( <B> )
##
##  For the basis <B> of a (Lie) algebra $L$, this function returns a
##  particular basis $C$ of the matrix space generated by $ad L$,
##  namely a basis consisting of elements of the form $ad x_i$,
##  where $x_i$ is a basis element of <B>.
##
AdjointBasis := NewAttribute( "AdjointBasis", IsBasis );
SetAdjointBasis := Setter( AdjointBasis );
HasAdjointBasis := Tester( AdjointBasis );


#############################################################################
##
#A  IndicesOfAdjointBasis( <B> )
##
IndicesOfAdjointBasis := NewAttribute( "IndicesOfAdjointBasis", IsBasis );
SetIndicesOfAdjointBasis := Setter( IndicesOfAdjointBasis );
HasIndicesOfAdjointBasis := Tester( IndicesOfAdjointBasis );


#############################################################################
##
#A  RadicalOfAlgebra( <A> )
##
##  is the intersection of maximal ideals of the algebra <A>.
##
RadicalOfAlgebra := NewAttribute( "RadicalOfAlgebra", IsAlgebra );
SetRadicalOfAlgebra := Setter( RadicalOfAlgebra );
HasRadicalOfAlgebra := Tester( RadicalOfAlgebra );


#############################################################################
##
#A  TrivialSubalgebra( <A> )
##
TrivialSubFLMLOR := TrivialSubadditiveMagmaWithZero;
SetTrivialSubFLMLOR := SetTrivialSubadditiveMagmaWithZero;
HasTrivialSubFLMLOR := HasTrivialSubadditiveMagmaWithZero;

TrivialSubalgebra := TrivialSubFLMLOR;
SetTrivialSubalgebra := SetTrivialSubFLMLOR;
HasTrivialSubalgebra := HasTrivialSubFLMLOR;


#############################################################################
##
#A  NullAlgebra( <R> )  . . . . . . . . . . zero dimensional algebra over <R>
##
#T or store this in the family ?
##
NullAlgebra := NewAttribute( "NullAlgebra", IsRing );
SetNullAlgebra := Setter( NullAlgebra );
HasNullAlgebra := Tester( NullAlgebra );


#############################################################################
##
#O  ProductSpace( <U>, <V> )
##
##  is the vector space $\langle u * v ; u \in U, v \in V \rangle$,
##  where $U$ and $V$ are vector spaces.
##
##  If $<U> = <V>$ is known to be an algebra then the product space is also
##  an algebra, moreover it is an ideal in <U>.
##  If <U> and <V> are known to be ideals in an algebra $A$
##  then the product space is known to be an algebra and an ideal in $A$.
##
ProductSpace := NewOperation( "ProductSpace",
    [ IsFreeLeftModule, IsFreeLeftModule ] );


#############################################################################
##
#O  DirectSumOfAlgebras( <A1>, <A2> )
#O  DirectSumOfAlgebras( <list> )
##
##  is the direct sum of the two algebras <A1> and <A2> resp. of the algebras
##  in the list <list>.
##
##  If all involved algebras are associative algebras then the result is also
##  known to be associative.
##  If all involved algebras are Lie algebras then the result is also known
##  to be a Lie algebra.
##
##  All involved algebras must have the same left acting domain.
##
##  The default case is that the result is a s.c. algebra.
##
##  If all involved algebras are matrix algebras, and either both are Lie
##  algebras or both are associative then the result is again a
##  matrix algebra of the appropriate type.
##
DirectSumOfAlgebras := NewOperation( "DirectSumOfAlgebras",
    [ IsDenseList ] );


#############################################################################
##
#F  FullMatrixAlgebraCentralizer( <F>, <lst> )
##
##  Compute the centralizer of the list of matrices <lst> in the full
##  matrix algebra over the ring <F>. 
##
FullMatrixAlgebraCentralizer := NewOperationArgs(
    "FullMatrixAlgebraCentralizer" );


#############################################################################
##
#O  AsAlgebra( <F>, <A> ) . . . . . . . . . . .  view <A> as algebra over <F>
##
AsFLMLOR := NewOperation( "AsFLMLOR", [ IsRing, IsCollection ] );

AsAlgebra := AsFLMLOR;


#############################################################################
##
#O  AsAlgebraWithOne( <F>, <A> )  . . . view <A> as algebra-with-one over <F>
##
AsFLMLORWithOne := NewOperation( "AsFLMLORWithOne",
    [ IsRing, IsCollection ] );

AsAlgebraWithOne := AsFLMLORWithOne;


#############################################################################
##
#O  AsSubalgebra( <A>, <S> )  . . . . . . . . . view <S> as subalgebra of <A>
##
AsSubFLMLOR := NewOperation( "AsSubFLMLOR", [ IsFLMLOR, IsCollection ] );

AsSubalgebra := AsSubFLMLOR;


#############################################################################
##
#O  AsSubalgebraWithOne( <A>, <S> ) . . view <S> as subalgebra-wth-one of <A>
##
AsSubFLMLORWithOne := NewOperation( "AsSubFLMLORWithOne",
    [ IsFLMLOR, IsDomain ] );

AsSubalgebraWithOne := AsSubFLMLORWithOne;


#############################################################################
##
#O  FpAlgebra( <F>, <A> )
##
##  Construct an isomorphic finitely presented <F>-algebra
##  of the algebra <A>.
##
FpAlgebra := NewOperation( "FpAlgebra", [ IsDivisionRing, IsAlgebra ] );


#############################################################################
##
#F  EmptySCTable( <dim>, <zero> )
#F  EmptySCTable( <dim>, <zero>, \"symmetric\" )
#F  EmptySCTable( <dim>, <zero>, \"antisymmetric\" )
##
##  'EmptySCTable' returns a structure constants table for an algebra of
##  dimension <dim>, describing trivial multiplication.
##  <zero> must be the zero of the coefficients domain.
##  If the multiplication is known to be (anti)commutative then
##  this can be indicated by the optional third argument.
##
##  For filling up the s.c. table, see "SetEntrySCTable".
##
EmptySCTable := NewOperationArgs( "EmptySCTable" );


#############################################################################
##
#F  SetEntrySCTable( <T>, <i>, <j>, <list> )
##
##  sets the entry of the structure constants table <T> that describes the
##  product of the <i>-th basis element with the <j>-th basis element to the
##  value given by the list <list>.
##
##  If <T> is known to be antisymmetric or symmetric then also the value
##  '<T>[<j>][<i>]' is set.
##
##  <list> must be of the form
##  $[ c_{ij}^{k_1}, k_1, c_{ij}^{k_2}, k_2, ... ]$.
##
SetEntrySCTable := NewOperationArgs( "SetEntrySCTable" );


#############################################################################
##
#F  GapInputSCTable( <T>, <varname> )
##
##  is a string that describes the structure constants table <T> in terms of
##  'EmptySCTable' and 'SetEntrySCTable'.
##  The assignments are made to the variable <varname>.
##
GapInputSCTable := NewOperationArgs( "GapInputSCTable" );


#############################################################################
##
#F  IdentityFromSCTable( <T> )
##
##  Let <T> be a s.c. table of an algebra $A$ of dimension $n$.
##  'IdentityFromSCTable( <T> )' is either 'fail' or the vector of length
##  $n$ that contains the coefficients of the multipicative identity of $A$
##  w.r.t. the basis that belongs to <T>.
##
IdentityFromSCTable := NewOperationArgs( "IdentityFromSCTable" );


#############################################################################
##
#F  QuotientFromSCTable( <T>, <num>, <den> )
##
##  Let <T> be a s.c. table of an algebra $A$ of dimension $n$.
##  'QuotientFromSCTable( <T> )' is either 'fail' or the vector of length
##  $n$ that contains the coefficients of the quotient of <num> and <den>
##  w.r.t. the basis that belongs to <T>.
##
##  We solve the equation system $<num> = x <den>$.
##  If no solution exists, 'fail' is returned.
##
##  In terms of the basis $B$ with vectors $b_1, \ldots, b_n$ this means
##  for $<num> = \sum_{i=1}^n a_i b_i$,
##      $<den> = \sum_{i=1}^n c_i b_i$,
##      $x     = \sum_{i=1}^n x_i b_i$ that
##  $a_k = \sum_{i,j} c_i x_j c_{ijk}$ for all $k$.
##  Here $c_{ijk}$ denotes the structure constants w.r.t. $B$.
##  This means $a = x M$ with $M_{ik} = \sum_{j=1}^n c_{ijk} c_j$.
##
QuotientFromSCTable := NewOperationArgs( "QuotientFromSCTable" );


#############################################################################
##
#F  TestJacobi( <T> )
##
##  tests whether the structure constants table <T> satisfies the Jacobi
##  identity
##  $[ v_i, [ v_j,v_k ] ] + [ v_j, [ v_k,v_i ] ] + [ v_k, [ v_i,v_j ] ] = 0$
##  for all basis vectors $v_i$ of the underlying algebra,
##  where $i \leq j \leq k$
##  (Thus antisymmetry is assumed.)
##
##  The function returns 'true' if the Jacobi identity is satisfied,
##  and a failing triple '[ i, j, k ]' otherwise.
##
TestJacobi := NewOperationArgs( "TestJacobi" );


#############################################################################
##
#O  ClosureLeftOperatorRing( <A>, <a> )
#O  ClosureLeftOperatorRing( <A>, <S> )
##
##  For a left operator ring <A> and either an element <a> of its elements
##  family or a left operator ring <S> (over the same left acting domain),
##  'ClosureLeftOperatorRing' returns the left operator ring generated by
##  both arguments.
##
ClosureLeftOperatorRing := NewOperation( "ClosureLeftOperatorRing",
    [ IsLeftOperatorRing, IsObject ] );

ClosureAlgebra := ClosureLeftOperatorRing;


#############################################################################
##
#F  MutableBasisOfClosureUnderAction( <F>, <Agens>, <gens>, <from>, <init>,
#F                                    <maxdim> )
##
##  Let <F> be a ring, and <Agens> a list of generators for an <F>-algebra
##  $A$,
##  <gens> be a list of vectors in the elements family of the family of $A$,
##  and <from> one of \"left\", \"right\", \"both\"; it means that elements
##  of <A> act via multiplication from the respective side(s).
##
##  <init> is a list of initial generating vectors.
##  It usually contains 'One( <A> )' in the case of algebras-with-one,
##  the algebra generators of <A> in the case of other algebras,
##  and ideal generators in the ideal case.
##
##  <maxdim> is an upper bound for the dimension of the closure.
##
##  'MutableBasisOfClosureUnderAction' returns a mutable basis of the
##  <F>-free left module generated by the vectors in <gens>
##  and their images under the action of $A$.
##
MutableBasisOfClosureUnderAction := NewOperationArgs(
    "MutableBasisOfClosureUnderAction" );


#############################################################################
##
##  Domain constructors
##

#############################################################################
##
#O  AlgebraByGenerators(<F>,<gens>) . . . . . . . . <F>-algebra by generators
#O  AlgebraByGenerators( <F>, <gens>, <zero> )
##
FLMLORByGenerators := NewOperation( "FLMLORByGenerators",
    [ IsRing, IsCollection ] );

AlgebraByGenerators := FLMLORByGenerators;


#############################################################################
##
#F  Algebra( <F>, <gens> )
#F  Algebra( <F>, <gens>, <zero> )
#F  Algebra( <F>, <gens>, "basis" )
#F  Algebra( <F>, <gens>, <zero>, "basis" )
##
##  'Algebra( <F>, <gens> )' is the algebra over the division ring
##  <F>, generated by the vectors in the list <gens>.
##
##  If there are three arguments, a division ring <F> and a list <gens>
##  and an element <zero>,
##  then 'Algebra( <F>, <gens>, <zero> )' is the <F>-algebra
##  generated by <gens>, with zero element <zero>.
##
##  If the last argument is the string '\"basis\"' then the vectors in
##  <gens> are known to form a basis of the algebra (as an <F>-vector space).
##
FLMLOR := NewOperationArgs( "FLMLOR" );

Algebra := FLMLOR;


#############################################################################
##
#F  Subalgebra( <A>, <gens> ) . . . . . subalgebra of <A> generated by <gens>
##
##  is the $F$-algebra generated by <gens>, with parent algebra <A>, where
##  $F$ is the left acting domain of <A>.
##
##  *Note* that being a subalgebra of <A> means to be an algebra, to be
##  contained in <A>, *and* to have the same left acting domain as <A>.
##
#F  Subalgebra( <A>, <gens>, "basis" )
##
##  is the subalgebra of <A> for that <gens> is a list of basis vectors.
##  It is *not* checked whether <gens> really are linearly independent
##  and whether all in <gens> lie in <A>.
##
SubFLMLOR := NewOperationArgs( "SubFLMLOR" );

Subalgebra := SubFLMLOR;


#############################################################################
##
#F  SubalgebraNC( <A>, <gens>, "basis" )
#F  SubalgebraNC( <A>, <gens> )
##
##  'SubalgebraNC' does not check whether all in <gens> lie in <A>.
##
SubFLMLORNC := NewOperationArgs( "SubFLMLORNC" );

SubalgebraNC := SubFLMLORNC;


#############################################################################
##
#O  AlgebraWithOneByGenerators(<F>,<gens>)  . <F>-alg.-with-one by generators
#O  AlgebraWithOneByGenerators( <F>, <gens>, <zero> )
##
FLMLORWithOneByGenerators := NewOperation( "FLMLORWithOneByGenerators",
    [ IsRing, IsCollection ] );

AlgebraWithOneByGenerators := FLMLORWithOneByGenerators;


#############################################################################
##
#F  AlgebraWithOne( <F>, <gens> )
#F  AlgebraWithOne( <F>, <gens>, <zero> )
#F  AlgebraWithOne( <F>, <gens>, "basis" )
#F  AlgebraWithOne( <F>, <gens>, <zero>, "basis" )
##
##  'AlgebraWithOne( <F>, <gens> )' is the algebra-with-one over the division
##  ring <F>, generated by the vectors in the list <gens>.
##
##  If there are three arguments, a division ring <F> and a list <gens>
##  and an element <zero>,
##  then 'AlgebraWithOne( <F>, <gens>, <zero> )' is the <F>-algebra-with-one
##  generated by <gens>, with zero element <zero>.
##
##  If the last argument is the string '\"basis\"' then the vectors in
##  <gens> are known to form a basis of the algebra (as an <F>-vector space).
##
FLMLORWithOne := NewOperationArgs( "FLMLORWithOne" );

AlgebraWithOne := FLMLORWithOne;


#############################################################################
##
#F  SubalgebraWithOne( <A>, <gens> )   subalg.-with-one of <A> gen. by <gens>
##
##  is the algebra-with-one generated by <gens>, with parent algebra <V>.
##
#F  SubalgebraWithOne( <A>, <gens>, "basis" )
##
##  is the subalgebra-with-one of <A> for that <gens> is a list of basis
##  vectors.
##  It is *not* checked whether <gens> really are linearly independent
##  and whether all in <gens> lie in <A>.
##
SubFLMLORWithOne := NewOperationArgs( "SubFLMLORWithOne" );

SubalgebraWithOne := SubFLMLORWithOne;


#############################################################################
##
#F  SubalgebraWithOneNC( <A>, <gens>, "basis" )
#F  SubalgebraWithOneNC( <A>, <gens> )
##
##  'SubalgebraWithOneNC' does not check whether all in <gens> lie in <V>.
##
SubFLMLORWithOneNC := NewOperationArgs( "SubFLMLORWithOneNC" );

SubalgebraWithOneNC := SubFLMLORWithOneNC;


#############################################################################
##
#F  LieAlgebra( <L> )
#F  LieAlgebra( <F>, <gens> )
#F  LieAlgebra( <F>, <gens>, <zero> )
#F  LieAlgebra( <F>, <gens>, "basis" )
#F  LieAlgebra( <F>, <gens>, <zero>, "basis" )
##
##  *Note* that the algebra returned by 'LieAlgebra' does not contain the
##  vectors in <gens>.
##  Instead the elements of this algebra are elements in a family of Lie
##  objects.
##  This allows to create Lie algebras from ring elements with respect to
##  the Lie bracket as product.  But of course the product in the Lie
##  algebra is the usual '\*'.
##
##  'LieAlgebra( <L> )' is the Lie algebra isomorphic to <L> as a vector
##  space but with the Lie bracket as product.
##
##  'LieAlgebra( <F>, <gens> )' is the Lie algebra over the division ring
##  <F>, generated *as Lie algebra* by the Lie objects corresponding to the
##  vectors in the list <gens>.
##
##  If there are three arguments, a division ring <F> and a list <gens>
##  and an element <zero>,
##  then 'LieAlgebra( <F>, <gens>, <zero> )' is the corresponding <F>-Lie
##  algebra with zero element the Lie object corresponding to <zero>.
##
##  If the last argument is the string '\"basis\"' then the vectors in
##  <gens> are known to form a basis of the algebra (as an <F>-vector space).
##
##  *Note* that even if each element in <gens> is already a Lie element,
##  i.e., is of the form 'LieElement( <elm> )' for an object <elm>,
##  the elements of the result lie in the Lie family of the family that
##  contains <gens> as a subset.
##
LieAlgebra := NewOperationArgs( "LieAlgebra" );


#############################################################################
##
#A  LieAlgebraByDomain( <A> )
##
##  is a Lie algebra isomorphic to the algebra <A> as a vector space,
##  but with the Lie bracket as product.
##
LieAlgebraByDomain := NewAttribute( "LieAlgebraByDomain", IsAlgebra );


#############################################################################
##
#O  LieAlgebraByGenerators( <F>, <gens> )
#O  LieAlgebraByGenerators( <F>, <gens>, <zero> )
##
LieAlgebraByGenerators := NewOperation( "LieAlgebraByGenerators",
    [ IsDivisionRing, IsCollection ] );


#############################################################################
##
#O  AsLieAlgebra( <F>, <A> ) . . . . . . . . view <A> as Lie algebra over <F>
##
##  Note that the multiplication in <A> is the same as in the result.
##
AsLieAlgebra := NewOperation( "AsLieAlgebra",
    [ IsDivisionRing, IsCollection ] );


#############################################################################
##
#F  FreeAssociativeAlgebra( <R>, <rank> )
#F  FreeAssociativeAlgebra( <R>, <rank>, <name> )
#F  FreeAssociativeAlgebra( <R>, <name1>, <name2>, ... )
##
FreeAssociativeAlgebra := NewOperationArgs( "FreeAssociativeAlgebra" );


#############################################################################
##
#F  SCAlgebra( <R>, <A> )
##
##  is the algebra <A> represented as s.c. algebra over <R>.
##
SCAlgebra := NewOperation( "SCAlgebra", [ IsDivisionRing, IsAlgebra ] );
#T necessary ?


#############################################################################
##
#F  AlgebraByStructureConstants( <R>, <sctable> )
#F  AlgebraByStructureConstants( <R>, <sctable>, <name> )
#F  AlgebraByStructureConstants( <R>, <sctable>, <name1>, <name2>, ... )
##
##  returns a free left module $A$ over the ring <R>,
##  with multiplication defined by the structure constants table <sctable>
##  of length $n$, say.
##
##  The algebra generators of $A$ are linearly independent
##  abstract vector space generators
##  $x_1, x_2, \ldots, x_n$ which are multiplied according to the formula
##  $ x_i x_j = \sum_{k=1}^n c_{ijk} x_k$
##  where '$c_{ijk}$ = <sctable>[i][j][1][i_k]'
##  and '<sctable>[i][j][2][i_k] = k'.
##
AlgebraByStructureConstants := NewOperationArgs(
    "AlgebraByStructureConstants" );


#############################################################################
##
#F  LieAlgebraByStructureConstants( <R>, <sctable> )
#F  LieAlgebraByStructureConstants( <R>, <sctable>, <name> )
#F  LieAlgebraByStructureConstants( <R>, <sctable>, <name1>, <name2>, ... )
##
##  'LieAlgebraByStructureConstants' does the same as
##  'AlgebraByStructureConstants', except that the result is assumed to be
##  a Lie algebra.
##
LieAlgebraByStructureConstants := NewOperationArgs(
    "LieAlgebraByStructureConstants" );


#############################################################################
##
#C  IsQuaternion
#C  IsQuaternionCollection
#C  IsQuaternionCollColl
##
##  category of elements in a algebra constructed by 'QuaternionAlgebra'
##
IsQuaternion := NewCategory( "IsQuaternion", IsScalar and IsAssociative );

IsQuaternionCollection := CategoryCollections( IsQuaternion );

IsQuaternionCollColl := CategoryCollections( IsQuaternionCollection );


#############################################################################
##
#F  QuaternionAlgebra( <F> )
#F  QuaternionAlgebra( <F>, <a>, <b> )
##
##  is a quaternion algebra over the field <F> with parameters <a> and <b> in
##  <F>, i.e., a four-dimensional associative <F>-algebra with basis
##  $(e,i,j,k)$ and multiplication defined by
##  $e e = e$, $e i = i e = i$, $e j = j e = j$, $e k = k e = k$,
##  $i i = <a> e$, $i j = - j i = k$, $i k = - k i = <a> j$,
##  $j j = <b> e$, $j k = - k j = <b> i$,
##  $k k = - <a> <b> e$.
##  The default values for <a> and <b> are $-1$ in <F>.
##
##  The embedding of the field 'GaussianRationals' into a quaternion algebra
##  $A$ over 'Rationals' is not uniquely determined.
##  One can specify one as a vector space homomorphism that maps '1' to the
##  first algebra generator of $A$, and 'E(4)' to one of the others.
##
QuaternionAlgebra := NewOperationArgs( "QuaternionAlgebra" );


#############################################################################
##
#F  ComplexificationQuat( <vector> )
#F  ComplexificationQuat( <matrix> )
##
##  Let $A = e F \oplus i F \oplus j F \oplus k F$ be a quaternion algebra
##  over the field $F$ of cyclotomics, with basis $(e,i,j,k)$.
##
##  If $v = v_1 + v_2 j$ is a row vector over $A$ with $v_1 = e w_1 + i w_2$
##  and $v_2 = e w_3 + i w_4$ then 'ComplexificationQuat( $v$ )' is the
##  concatenation of $w_1 + 'E(4)' w_2$ and $w_3 + 'E(4)' w_4$.
##
##  If $M = M_1 + M_2 j$ is a matrix over $A$ with $M_1 = e N_1 + i N_2$
##  and $M_2 = e N_3 + i N_4$ then 'ComplexificationQuat( <M> )' is the
##  block matrix over $e F \oplus i F$
##  \[ \left( \begin{array}{rr}
##                  N_1 + 'E(4)' N_2 & N_3 + 'E(4)' N_4           \\
##                - N_3 + 'E(4)' N_4 & N_1 - 'E(4)' N_2
##            \end{array} \right) \]
##
##  Then 'ComplexificationQuat( <v> ) * ComplexificationQuat( <M> ) = 
##        ComplexificationQuat( <v> \*\ <M>', since
##  \[ v M = v_1 M_1 + v_2 j M_1 + v_1 M_2 j + v_2 j M_2 j
##         =   ( v_1 M_1 - v_2 \overline{M_2} )
##           + ( v_1 M_2 + v_2 \overline{M_1} ) j . \]
##             
ComplexificationQuat := NewOperationArgs( "ComplexificationQuat" );


#############################################################################
##
#F  OctaveAlgebra( <F> )
##
OctaveAlgebra := NewOperationArgs( "OctaveAlgebra" );


#############################################################################
##
#F  FullMatrixFLMLOR( <R>, <n> )
##
##  is the matrix FLMLOR $<R>^[<n>,<n>]$, for a ring <R> and a nonnegative
##  integer <n>.
##
FullMatrixFLMLOR := NewOperationArgs( "FullMatrixFLMLOR" );

FullMatrixAlgebra := FullMatrixFLMLOR;
MatrixAlgebra := FullMatrixFLMLOR;
MatAlgebra := FullMatrixFLMLOR;


#############################################################################
##
#O  NaturalHomomorphismByIdeal( <G>, <I> )  . . . . . map onto factor algebra
##
NaturalHomomorphismByIdeal := NewOperation( "NaturalHomomorphismByIdeal",
    [ IsFLMLOR, IsFLMLOR ] );


#############################################################################
##
#C  IsMatrixFLMLOR( <obj> ) . . . . . .  test if an object is a matrix FLMLOR
##
IsMatrixFLMLOR :=
    IsFLMLOR and IsRingElementCollCollColl;


#############################################################################
##
#M  IsFiniteDimensional( <A> )  . . . . matrix FLMLORs are finite dimensional
##
InstallTrueMethod( IsFiniteDimensional, IsMatrixFLMLOR );


#############################################################################
##
#E  algebra.gd  . . . . . . . . . . . . . . . . . . . . . . . . . . ends here



