#include "xbasic_types.h"
#include "xparameters.h"
#include "sleep.h"
#include "xtime_l.h"

sint32 *baseaddr_p = (sint32 *)XPAR_MYIP_0_S00_AXI_BASEADDR;

int main()
{
	*(baseaddr_p+0) = 0x0006000A;
	while(1)
	{
		xil_printf("Multiplier Test\n\r");

		// Write multiplier inputs to register 0
		// *(baseaddr_p+0) = 0x00060003;

		xil_printf("Wrote: 0x%08x \n\r", *(baseaddr_p+0));

		// Read multiplier output from register 1
		xil_printf("Read : 0x%08x \n\r", *(baseaddr_p+1));

		sleep(1);
		*(baseaddr_p+0) = *(baseaddr_p+0)-1; // You should observe the LED truning on when the result of mul = 0


	}
return 0;
}
