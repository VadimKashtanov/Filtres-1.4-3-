#pragma once

#define INSTS 3

// mdl.quelconque  [        inst0            ][     inst1     ][ inst2 ][                   inst3                ]  T fois a la suite
//	ESPACE = somme( inst[i] )
// inst[i] :
//    [                    inst[i]                     ]
//    [    ENTREES    ][    AUTRES    ][    SORTIES    ]

typedef struct {
	uint BLOQUES;
	uint F_PAR_BLOQUES;
	uint * lignes;
	uint * lignes__d;
} Params_Filtres;

typedef struct {
	uint X;
	uint Y;
	uint ACTIV;
} Params_Dot1d;

typedef struct {
	uint X;
	uint Y;
} Params_Lstm;

typedef struct {
	uint ID;
	//
	uint POIDS;
	uint VARS;
	uint LOCDS;
	uint ENTREES;
	uint SORTIES;
	//
	union {
		Params_Filtres * p_filtres;
		Params_Dot1d   * p_dot1d;
		Params_Lstm    * p_lstm;
	} PARAMS;
} Inst_t;

//	Mem
typedef Inst_t* (*cree_inst_f)(uint * PARAMS);
typedef void (*liberer_inst_f)(Inst_t * inst);
cree_inst_f cree_inst[INSTS];
liberer_inst_f liberer_inst[INSTS];

//	Controle
typedef void (*zero_inst_f)(Mdl_t * mdl, uint id);
zero_inst_f zero_inst[INSTS];