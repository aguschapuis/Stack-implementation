/*********************************************************************************************
*	main.s
*	by Gonzalo Vodanovic - gonzalovodanovic@gmail.com
*
**********************************************************************************************/
.text
.org 0x0000

.equ PERIPHERAL_BASE, 0x3F000000 // Peripheral Base Address
.equ GPIO_BASE, 0x200000 	// GPIO Base Address
.equ GPIO_GPFSEL1, 0x4 		// GPIO Function Select 1
.equ GPIO_GPSET0, 0x1C 		// GPIO Pin Output Set 0
.equ GPIO_GPCLR0, 0x28 		// GPIO Pin Output Clear 0
.equ GPIO_FSEL8_OUT, 0x1000000 	// GPIO Function Select: GPIO Pin X8 Is An Output
.equ GPIO_18, 0x40000 		// GPIO Pin 0: 18


	// Set Cores 1..3 To Infinite Loop
	mrs X0, MPIDR_EL1 	// X0 = Multiprocessor Affinity Register (MPIDR)
	ands X0,X0,3 		// X0 = CPU ID (Bits 0..1)
	b.ne CoreLoop 		// IF (CPU ID != 0) Branch To Infinite Loop (Core ID 1..3)

	// Load in W0 the GPIO base address
	ldr X0,=(PERIPHERAL_BASE + GPIO_BASE)

	// Config GPIO18 as output
	mov W1,GPIO_FSEL8_OUT
	str W1,[X0,GPIO_GPFSEL1]

	// reg W1 contains the mask for set/clear the gpios
	mov W1,GPIO_18

	//------------------ CODE HERE ------------------------------------------------------
	

infloop:

do:		mov X6,9873 //do
 			mov X10,1438 //5 SEGUNDOS
		do1:
				cbz X10,re

	      str W1,[X0,GPIO_GPSET0]	// Set GPIO18

	 		bl espera

        str W1,[X0,GPIO_GPCLR0]	// Clear GPIO18

			bl espera

		sub X10,X10,1

		b do1

re:  	add XZR,XZR,XZR
			mov x6,8820
			mov x10,1614
		re1:
				cbz X10,mi

	      str W1,[X0,GPIO_GPSET0]	// Set GPIO18

		bl espera

        str W1,[X0,GPIO_GPCLR0]	// Clear GPIO18

		bl espera

		sub X10,X10,1

        b re1

mi:  	add XZR,XZR,XZR
			add XZR,XZR,XZR
			add XZR,XZR,XZR
			add XZR,XZR,XZR
			add XZR,XZR,XZR
			add XZR,XZR,XZR
			add XZR,XZR,XZR
			mov x6,7853
			mov x10,1811
		mi1:
				cbz X10,fa

	      str W1,[X0,GPIO_GPSET0]	// Set GPIO18

		bl espera

        str W1,[X0,GPIO_GPCLR0]	// Clear GPIO18

		bl espera

		sub X10,X10,1

        b mi1

fa:  	add XZR,XZR,XZR
			add XZR,XZR,XZR
			add XZR,XZR,XZR
			add XZR,XZR,XZR
			add XZR,XZR,XZR
			add XZR,XZR,XZR
			mov x6,7399
			mov x10,1919
		fa1:
				cbz X10,sol

	      str W1,[X0,GPIO_GPSET0]	// Set GPIO18

		bl espera

        str W1,[X0,GPIO_GPCLR0]	// Clear GPIO18

		bl espera

		sub X10,X10,1

        b fa1

sol:  add XZR,XZR,XZR
			add XZR,XZR,XZR
			add XZR,XZR,XZR
			add XZR,XZR,XZR
			add XZR,XZR,XZR
			add XZR,XZR,XZR
			add XZR,XZR,XZR
			add XZR,XZR,XZR
			mov x6,6600
			mov x10,2154
		sol1:
				cbz X10,la

	      str W1,[X0,GPIO_GPSET0]	// Set GPIO18

		bl espera

        str W1,[X0,GPIO_GPCLR0]	// Clear GPIO18

		bl espera

		sub X10,X10,1

        b sol1

la:  	
			add XZR,XZR,XZR
			add XZR,XZR,XZR
			add XZR,XZR,XZR
			add XZR,XZR,XZR
			add XZR,XZR,XZR
			add XZR,XZR,XZR
			add XZR,XZR,XZR
			mov x6,5880
			mov x10,2419
		la1:
				cbz X10,si

	      str W1,[X0,GPIO_GPSET0]	// Set GPIO18

			bl espera

        str W1,[X0,GPIO_GPCLR0]	// Clear GPIO18

			bl espera

		sub X10,X10,1

        b la1

si:  	add XZR,XZR,XZR
			add XZR,XZR,XZR
			add XZR,XZR,XZR
			add XZR,XZR,XZR
			add XZR,XZR,XZR
			add XZR,XZR,XZR
			add XZR,XZR,XZR
			
			mov x6,5210
			mov x10,2716
		si1:
				cbz X10,CoreLoop

	      str W1,[X0,GPIO_GPSET0]	// Set GPIO18

			bl espera

        str W1,[X0,GPIO_GPCLR0]	// Clear GPIO18

			bl espera

		sub X10,X10,1

        b si1
				
	//----------------------------------------------------------------------------------

CoreLoop:       // Infinite Loop For Core 1..3
  b CoreLoop

espera: 
			add X9,XZR,X6
			loop: sub x9,x9,1
				  cbnz x9,loop
				  br X30


		  
