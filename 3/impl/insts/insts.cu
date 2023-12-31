#include "inst.cuh"

cree_inst_f cree_inst[INSTS] = {
	cree_inst_filtres,
	cree_inst_dot1d,
	cree_inst_lstm
}

void liberer_inst(Inst_t * inst) {
	free(inst);
}