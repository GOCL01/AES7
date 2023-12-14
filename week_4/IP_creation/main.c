#include "xil_types.h"
#include "xparameters.h"

sint32 *baseaddr_p = (sint32 *)XPAR_MYIP_MUL_0_S00_AXI_BASEADDR;

int main()
{

xil_printf("Multiplier Test\n\r");

// Write multiplier inputs to register 0
*(baseaddr_p+0) = 0x00060003;
xil_printf("Wrote: 0x%08x \n\r", *(baseaddr_p+0));

// Read multiplier output from register 1
xil_printf("Read : 0x%08x \n\r", *(baseaddr_p+1));

xil_printf("End of test\n\n\r");

return 0;
}