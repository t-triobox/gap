#############################################################################
##
#W  modulmat.gi                 GAP library                     Thomas Breuer
##
#H  @(#)$Id$
##
#Y  Copyright (C)  1997,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains methods for *matrix modules*, that is,
##  free left modules consisting of matrices.
##
##  Especially methods for *full matrix modules* $R^[m,n]$ are contained.
##
##  (See the file 'modulrow.gi' for the methods for row modules.
##  Note that we do not need methods for enumerator and iterator of full
##  matrix modules because the standard delegation to full row modules
##  suffices.)
##
Revision.modulmat_gi :=
    "@(#)$Id$";


#############################################################################
##
#M  LeftModuleByGenerators( <R>, <mats> ) . . . . . construct a matrix module
##
InstallMethod( LeftModuleByGenerators,
    "method for ring and list of matrices (elements in the same family)",
    IsElmsCollColls,
    [ IsRing, IsCollection ], 0,
    function( R, mats )
    local V;

    V:= Objectify( NewType( FamilyObj( mats ),
                                IsLeftModule
                            and IsMatrixModuleRep
                            and IsAttributeStoringRep ),
                   rec() );
    SetLeftActingDomain( V, R );
    SetGeneratorsOfLeftModule( V, AsList( mats ) );

    # Set the vector dimension.
    V!.vectordim:= DimensionsMat( mats[1] );

    return V;
    end );


#############################################################################
##
#M  LeftModuleByGenerators( <R>, <mats> ) . . . construct a Lie matrix module
##
InstallMethod( LeftModuleByGenerators,
    "method for ring and list of matrices (elements in the same family)",
    IsElmsCollLieColls,
    [ IsRing, IsCollection ], 0,
    function( R, mats )
    local V;

    V:= Objectify( NewType( FamilyObj( mats ),
                                IsLeftModule
                            and IsMatrixModuleRep
                            and IsAttributeStoringRep ),
                   rec() );
    SetLeftActingDomain( V, R );
    SetGeneratorsOfLeftModule( V, AsList( mats ) );

    # Set the vector dimension.
    V!.vectordim:= DimensionsMat( mats[1] );

    return V;
    end );


#############################################################################
##
#M  LeftModuleByGenerators( <R>, <mats>, <zero> ) . construct a matrix module
##
InstallOtherMethod( LeftModuleByGenerators,
    "method for ring, list of matrices (over the ring), and matrix",
    true,
#T explicit 2nd argument above!
    [ IsRing, IsHomogeneousList, IsMatrix ], 0,
    function( R, mats, zero )
    local V;

    # Check whether this method is the right one.
    if    not (    IsElmsColls( FamilyObj( R ), FamilyObj( zero ) )
                or IsElmsLieColls( FamilyObj( R ), FamilyObj( zero ) ) )
       or not (    IsEmpty( mats )
                or IsCollsElms( FamilyObj( mats ), FamilyObj( zero ) ) ) then
      TryNextMethod();
    fi;

    V:= Objectify( NewType( FamilyObj( mats ),
                                IsLeftModule
                            and IsMatrixModuleRep
                            and IsAttributeStoringRep ),
                   rec() );
    SetLeftActingDomain( V, R );
    SetGeneratorsOfLeftModule( V, AsList( mats ) );
    SetZero( V, zero );
    V!.vectordim:= DimensionsMat( mats[1] );

    return V;
    end );


#############################################################################
##
#F  FullMatrixModule( <R>, <m>, <n> )
##
##  Let $E_{i,j}$ be the matrix with value 1 in row $i$ and $column $j$, and
##  zero otherwise.
##  Clearly the full matrix space is generated by all $E_{i,j}$, $i$ and
##  $j$ ranging from 1 to <m> and <n>, respectively.
##
##  'FullMatrixModule' returns a module of ordinary matrices
##  (not of Lie matrices).
##
FullMatrixModule := function( R, m, n )

    local M;   # the free module record, result

    if not ( IsRing( R ) and IsInt( m ) and 0 <= m
                         and IsInt( n ) and 0 <= n ) then
      Error( "usage: FullMatrixModule( <R>, <m>, <n> ) for ring <R>" );
    elif m = n then
      return FullMatrixFLMLOR( R, m );
    fi;

    if IsDivisionRing( R ) then
      M:= Objectify( NewType( CollectionsFamily( CollectionsFamily(
                                                     FamilyObj( R ) ) ),
                                  IsFreeLeftModule
                              and IsGaussianSpace
                              and IsMatrixModuleRep
                              and IsFullMatrixModule
                              and IsAttributeStoringRep ),
                     rec() );
    else
      M:= Objectify( NewType( CollectionsFamily( CollectionsFamily(
                                                     FamilyObj( R ) ) ),
                                  IsFreeLeftModule
                              and IsMatrixModuleRep
                              and IsFullMatrixModule
                              and IsAttributeStoringRep ),
                     rec() );
    fi;
    SetLeftActingDomain( M, R );
    M!.vectordim:= [ m, n ];

    return M;
end;

FullMatrixSpace := FullMatrixModule;
MatrixSpace := FullMatrixModule;
MatSpace := FullMatrixModule;


#############################################################################
##
#M  \^( <M>, [ <m>, <n> ] ) . . . . . . . . .  full matrix module over a ring
##
InstallOtherMethod( \^,
    "method for ring and list of integers (delegate to 'FullMatrixModule')",
    true,
    [ IsRing, IsCyclotomicsCollection and IsList ], 0,
    function( R, n )
    if     Length( n ) = 2
       and IsInt( n[1] ) and 0 <= n[1]
       and IsInt( n[2] ) and 0 <= n[2] then
      return FullMatrixModule( R, n[1], n[2] );
    fi;
    TryNextMethod();
    end );


#############################################################################
##
#M  IsFullMatrixModule( M )
##
InstallMethod( IsFullMatrixModule,
    true,
    [ IsFreeLeftModule and IsMatrixModuleRep ], 0,
    M ->     Dimension( M ) = M!.vectordim[1] * M!.vectordim[2]
         and ForAll( GeneratorsOfLeftModule( M ),
                     v -> IsSubset( LeftActingDomain( M ), v ) ) );
     

#############################################################################
##
#M  Dimension( <M> )
##
InstallMethod( Dimension,
    "method for full matrix module",
    true,
    [ IsFreeLeftModule and IsMatrixModuleRep and IsFullMatrixModule ], 0,
    M -> M!.vectordim[1] * M!.vectordim[2] );


#############################################################################
##
#M  Random( <M> )
##
InstallMethod( Random,
    "method for full matrix module",
    true,
    [ IsFreeLeftModule and IsMatrixModuleRep and IsFullMatrixModule ], 0,
    function( M )
    local random;
    random:= RandomMat( M!.vectordim[1], M!.vectordim[2],
                        LeftActingDomain( M ) );
    if IsLieObjectCollection( M ) then
      random:= LieObject( random );
    fi;
    return random;
    end );


#############################################################################
##
#M  GeneratorsOfLeftModule( <V> )
##
StandardGeneratorsOfFullMatrixModule := function( M )
    local R, one, m, n, zeromat, gens, i, j, gen;
    R:= LeftActingDomain( M );
    one:= One( R );
    m:= M!.vectordim[1];
    n:= M!.vectordim[2];
    zeromat:= NullMat( m, n, R );
    gens:= [];
    for i in [ 1 .. m ] do
      for j in [ 1 .. n ] do
        gen:= List( zeromat, ShallowCopy );
        gen[i][j]:= one;
        Add( gens, gen );
      od;
    od;

    if IsLieObjectCollection( M ) then
      gens:= List( gens, LieObject );
    fi;

    return gens;
end;

InstallMethod( GeneratorsOfLeftModule,
    "method for full matrix module",
    true,
    [ IsFreeLeftModule and IsMatrixModuleRep and IsFullMatrixModule ], 0,
    StandardGeneratorsOfFullMatrixModule );


#############################################################################
##
#M  PrintObj( <M> )
##
InstallMethod( PrintObj,
    "method for full matrix module",
    true,
    [ IsFreeLeftModule and IsMatrixModuleRep and IsFullMatrixModule ], 0,
    function( M )
    Print( "( ", LeftActingDomain( M ), "^", M!.vectordim, " )" );
    end );


#############################################################################
##
#M  \in( <v>, <V> )
##
InstallMethod( \in,
    "method for full matrix module",
    IsElmsColls,
    [ IsObject,
      IsFreeLeftModule and IsMatrixModuleRep and IsFullMatrixModule ], 0,
    function( mat, M )
    return     IsMatrix( mat )
           and DimensionsMat( mat ) = M!.vectordim
           and ForAll( mat, row -> IsSubset( LeftActingDomain( M ), row ) );
    end );


#############################################################################
##
#M  BasisVectors( <B> ) . . . . for a canonical basis of a full matrix module
##
InstallMethod( BasisVectors,
    "method for canonical basis of a full matrix module",
    true,
    [ IsBasis and IsCanonicalBasis and IsCanonicalBasisFullMatrixModule ], 0,
    B -> StandardGeneratorsOfFullMatrixModule( UnderlyingLeftModule( B ) ) );


#############################################################################
##
#M  CanonicalBasis( <V> )
##
InstallMethod( CanonicalBasis, true,
    [ IsFreeLeftModule and IsFullMatrixModule ], 0,
    function( V )
    local B;
    B:= Objectify( NewType( FamilyObj( V ),
                                IsBasis
                            and IsCanonicalBasis
                            and IsCanonicalBasisFullMatrixModule
                            and IsAttributeStoringRep ),
                   rec() );
    SetUnderlyingLeftModule( B, V );
    return B;
    end );


#############################################################################
##
#M  Coefficients( <B>, <m> )  . for a canonical basis of a full matrix module
##
InstallMethod( Coefficients,
    "method for canonical basis of a full matrix module",
    IsCollsElms,
    [ IsBasis and IsCanonicalBasisFullMatrixModule, IsMatrix ], 0,
    function( B, mat )
    local V, R;
    V:= UnderlyingLeftModule( B );
    R:= LeftActingDomain( V );
    if     DimensionsMat( mat ) = V!.vectordim
       and ForAll( mat, row -> IsSubset( R, row ) ) then
      return Concatenation( mat );
    else
      return fail;
    fi;
    end );


#############################################################################
##
#M  BasisOfDomain( <M> )  . . . . . . . . . . . . . .  for full matrix module
##
InstallMethod( BasisOfDomain,
    "method for full matrix module",
    true,
    [ IsFreeLeftModule and IsMatrixModuleRep and IsFullMatrixModule ],
    SUM_FLAGS,
    CanonicalBasis );


#############################################################################
##
#E  modulmat.gi . . . . . . . . . . . . . . . . . . . . . . . . . . ends here



