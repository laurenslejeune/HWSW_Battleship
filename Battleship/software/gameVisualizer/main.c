#include "../gameVisualizer_bsp/system.h"

void reset()
{
	int * start = GAMEMEMORY_AVALON_INTERFACE_0_BASE;
	for(int i = 0; i < GAMEMEMORY_AVALON_INTERFACE_0_SPAN ; i++)
	{
		*(start + i) = 0;
	}
}

int main()
{
	reset();
	int * start = GAMEMEMORY_AVALON_INTERFACE_0_BASE;


	*start = 255;
	*(start+1) = 255;
	*(start+2) = 255;
	*(start+3) = 255;
	*(start+4) = 255;
	*(start+5) = 255;
	*(start+6) = 255;
	*(start+7) = 255;
	*(start+8) = 255;
	*(start+9) = 255;
	*(start+10) = 255;

	/*
	for(int i = 0; i < GAMEMEMORY_AVALON_INTERFACE_0_SPAN / 1; i++)
	{
		*(start + i) = i;
	}
	*/
	return 0;
}
