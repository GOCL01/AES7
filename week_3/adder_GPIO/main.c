#include "platform.h"
#include "xbasic_types.h"
#include "xparameters.h"
#include "sleep.h"
#include "xtime_l.h"

Xuint32 *baseaddr_p_op =0x41200000;
Xuint32 *baseaddr_p_res =0x41210000;
int main()
{
init_platform();

xil_printf("AXI4 Adder IP Demo\n\r");

*(baseaddr_p_op+0) = 77;
*(baseaddr_p_op+2) = 23;
while(1)
{
	// Register 0
	xil_printf("First Value: %d \n\r", *(baseaddr_p_op+0));

	// Register 1
	xil_printf("Second Value: %d \n\r", *(baseaddr_p_op+2));

	//Register 2
	xil_printf("Sum of first and second values is: %d \n\r", *(baseaddr_p_res+0));

	xil_printf("End of test\n\n\r");

	sleep(1);

	*(baseaddr_p_op+0)=*(baseaddr_p_op+0)+1;
	*(baseaddr_p_op+2)=*(baseaddr_p_op+2)+1;
}

return 0;
}