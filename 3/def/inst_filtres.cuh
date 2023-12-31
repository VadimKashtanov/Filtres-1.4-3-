#pragma once

#include "marchee.cuh"

void  intel_filtres(				//	mode == 0
	uint depart, uint T,
	uint bloques, uint f_par_bloque, uint * ligne,
	float * x, float * dif_x,
	float * f, float * dif_f,
	float * y,
	float * locd_s, float * locd_d);

void nvidia_filtres_naive(			//	mode == 1
	uint depart, uint T,
	uint bloques, uint f_par_bloque, uint * ligne,
	float * x, float * dif_x,
	float * f, float * dif_f,
	float * y,
	float * locd_s, float * locd_d);

void nvidia_filtres_shared(			//	mode == 2
	uint depart, uint T,
	uint bloques, uint f_par_bloque, uint * ligne,
	float * x, float * dif_x,
	float * f, float * dif_f,
	float * y,
	float * locd_s, float * locd_d);

void f_filtres(Mdl_t * mdl, uint inst, uint mode);

//	----------------------------

void  d_intel_filtres(				//	mode == 0
	uint depart, uint T,
	uint bloques, uint f_par_bloque, uint * ligne,
	float * x, float * dif_x,
	float * f, float * dif_f,
	float * y,
	float * locd_s, float * locd_d,
	float * dy,
	float * df);

void d_nvidia_filtres_naive(		//	mode == 1
	uint depart, uint T,
	uint bloques, uint f_par_bloque, uint * ligne,
	float * x, float * dif_x,
	float * f, float * dif_f,
	float * y,
	float * locd_s, float * locd_d,
	float * dy,
	float * df);

void d_nvidia_filtres_shared(		//	mode == 2
	uint depart, uint T,
	uint bloques, uint f_par_bloque, uint * ligne,
	float * x, float * dif_x,
	float * f, float * dif_f,
	float * y,
	float * locd_s, float * locd_d,
	float * dy,
	float * df);

void df_filtres(Mdl_t * mdl, uint inst, uint mode);