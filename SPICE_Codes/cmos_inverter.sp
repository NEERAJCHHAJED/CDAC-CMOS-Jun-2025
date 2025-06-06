*** MODEL Descriptions ***
.include mos.lib

M1 out in vdd vdd pmos W=0.5u L=0.25u
M2 out in 0 0 nmos W=0.375u L=0.25u

cload out 0 10f

Vdd vdd 0 2.5
Vin in 0 0 pulse 0 2.5 0 10p 10p 1n 2n
*** SIMULATION Commands ***
.op
.tran 10p 4n
*** .include tsmc_025um_model.mod  ***

.control
run
write mydata.txt
display
plot v(in) 
plot v(out) 
.endc

.end
