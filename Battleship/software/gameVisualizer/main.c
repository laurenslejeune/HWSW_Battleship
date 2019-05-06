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

	/*
	*start = 15;
	*(start+1) = 0;
	*(start+2) = 15;
	*/

	for(int i = 0; i < GAMEMEMORY_AVALON_INTERFACE_0_SPAN / 1; i++)
	{
		*(start + i) = i;
	}

	return 0;
}
