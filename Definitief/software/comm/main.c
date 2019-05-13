#include "../comm_bsp/system.h"

int main()
{
	int * comm = COMMUNICATION_0_BASE;
	int * master = MASTERSLAVE_0_BASE;
	while(1)
	{
		if(master)
		{
			//*comm = *comm;
			*comm = 63;
		}
		//int test = *comm;
		//*comm = (*master << 5) + (*master << 4) + (*master << 3) + (*master << 2) + (*master << 1) + (*master << 0);
		//int test = *comm;
		//*comm = test;
	}
	return 0;
}
