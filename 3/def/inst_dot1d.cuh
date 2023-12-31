#pragma once

#define TANH 0
#define LOGISTIC 1
#define SPECIALE 2

#define tanh_f(s)    (tanh(s))
#define tanh_df(s,a) (1 - a*a)

#define logistique_f(s)    (1.f/(1.f + expf(-s)))
#define logistique_df(s,a) (a * (a - 1.f))

#define speciale_f(s)    (expf(-powf(s-1.5,4)) - expf(-powf(s+1.5,4)))
#define speciale_df(s,a) (-4*powf(s-1.5, 3)*speciale_f(s-1.5) + 4*powf(s+1.5,3)*speciale_f(s+1.5))

#define ACTIV(mode, s) (\
	(mode == TANH ? tanh_f(s) \
	: (mode == LOGISTIC ? logistique_f(s) \
	: (mode == SPECIALE ? speciale_f(s) \
	: 0 ))))
#define dACTIV(mode, s,a) (\
	(mode == TANH ? tanh_df(s,a) \
	: (mode == LOGISTIC ? logistique_df(s,a) \
	: (mode == SPECIALE ? speciale_df(s,a) \
	: 0 ))))

#include "marchee.cuh"

void intel_dot1d(
	uint activation,
	uint X, uint Y,
	uint depart, uint T,
	float * x, float * y,
	float * p,
	float * locd);

void d_intel_dot1d(
	uint activation,
	uint X, uint Y,
	uint depart, uint T,
	float * x, float * y,
	float * p,
	float * locd,
	float * dy,
	float * dx,
	float * dp);

//	============================================

void nvidia_dot1d_naive(	//	2 versions : 1x stricte et 1x non stricte
	uint activation,
	uint X, uint Y,
	uint depart, uint T,
	float * x, float * y,
	float * p,
	float * locd);

void nvidia_dot1d_shared(	//	2 versions : 1 stricte et une non stricte
	uint activation,
	uint X, uint Y,
	uint depart, uint T,
	float * x, float * y,
	float * p,
	float * locd);

void nvidia_dot1d_shared_2_16(	//	2 versions : 1 stricte et une non stricte
	uint activation,
	uint X, uint Y,
	uint depart, uint T,
	float * x, float * y,
	float * p,
	float * locd);

void nvidia_dot1d(
	uint activation,
	uint X, uint Y,
	uint depart, uint T,
	float * x, float * y,
	float * p,
	float * locd,
	uint mode);

//	============================================

void d_nvidia_dot1d_naive(	//	2 versions : 1x stricte et 1x non stricte
	uint activation,
	uint X, uint Y,
	uint depart, uint T,
	float * x, float * y,
	float * p,
	float * locd,
	float * dy,
	float * dx,
	float * dp);

void d_nvidia_dot1d_shared(	//	2 versions : 1 stricte et une non stricte
	uint activation,
	uint X, uint Y,
	uint depart, uint T,
	float * x, float * y,
	float * p,
	float * locd,
	float * dy,
	float * dx,
	float * dp);

void d_nvidia_dot1d_shared_2_16(	//	2 versions : 1 stricte et une non stricte
	uint activation,
	uint X, uint Y,
	uint depart, uint T,
	float * x, float * y,
	float * p,
	float * locd,
	float * dy,
	float * dx,
	float * dp);

void  d_nvidia_dot1d(
	uint activation,
	uint X, uint Y,
	uint depart, uint T,
	float * x, float * y,
	float * p,
	float * locd,
	float * dy,
	float * dx,
	float * dp,
	uint mode);

//	============================================

void verif_do1d();