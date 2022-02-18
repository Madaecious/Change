#############################################################################################
#
#	Name:			Barros, Mark
#	Course:			CS2640 - Computer Organization and Assembly Programming
#	Description:	Program that tells what coins to give out for
#					any amount of change from 1 cent to 99 cents.
#
#############################################################################################


				.data
header:			.asciiz		"Change by M. Barros\n\n"
prompt:			.asciiz		"Enter the change? "
quarters:		.asciiz		"Quarter: "			
dimes:			.asciiz		"Dime: "
nickels:		.asciiz		"Nickel: "
pennies:		.asciiz		"Penny: "
newline:		.asciiz		"\n"

				.text
main:			# output the header and prompt --------------------------------------------
				la			$a0, header
				li			$v0, 4
				syscall				
				la			$a0, prompt
				li			$v0, 4
				syscall
				# accept and store the cents value ---------------------------------------
				li			$v0, 5
				syscall
				move		$t0, $v0
				la			$a0, newline
				li			$v0, 4
				syscall
				# process the quarters ---------------------------------------------------
				li			$t1, 25
				div			$t0, $t1				
				mflo		$t1
				beq			$t1, $zero, else0	# if no quarters, skip the quarters output				
				la			$a0, quarters
				li			$v0, 4
				syscall
				mflo		$a0
				li			$v0, 1
				syscall
				la			$a0, newline
				li			$v0, 4
				syscall
				# process the dimes ------------------------------------------------------		
				else0:							# jump to here if no quarters
				li			$t1, 10
				mfhi		$t0
				div			$t0, $t1
				mflo		$t1
				beq			$t1, $zero, else1	# if no dimes, skip the dimes output
				la			$a0, dimes
				li			$v0, 4
				syscall
				mflo		$a0
				li			$v0, 1
				syscall
				la			$a0, newline
				li			$v0, 4
				syscall
				# process the nickles ---------------------------------------------------
				else1:							# jump to here if no dimes
				li			$t1, 5
				mfhi		$t0
				div			$t0, $t1
				mflo		$t1
				beq			$t1, $zero, else2	# if no nickels, skip the nickels output
				la			$a0, nickels
				li			$v0, 4
				syscall
				mflo		$a0
				li			$v0, 1
				syscall
				la			$a0, newline
				li			$v0, 4
				syscall
				# process the pennies --------------------------------------------------
				else2:							# jump to here if no nickels
				mfhi		$t1
				beq			$t1, $zero, else3	# if no pennies, skip the pennies output
				la			$a0, pennies
				li			$v0, 4
				syscall
				mfhi		$a0
				li			$v0, 1
				syscall
				la			$a0, newline
				li			$v0, 4
				syscall
				# exit the program -----------------------------------------------------
				else3:							# jump to here if no pennies
				li			$v0, 10
				syscall
				# ----------------------------------------------------------------------