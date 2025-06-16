#!/bin/bash

# set grid and snap
grid 50nm 50nm
snap user

# set crosshair at origin and draw gate of transistors (poly)
box size 0 0
box position 0 0
box size 150nm 1000nm
paint poly

# set crosshair at origin and draw drain and source diffusions (ndiff)
box size 0 0
box position 0 0
box position -450nm 0
box size 1050nm 1000nm
paint ndiff

# extend the poly over the diffusions to fix DRC errors
box size 0 0
box position 0 0
box size 150nm -150nm
paint poly
box size 0 0
box position 0 0
box position 0 1000nm
box size 150nm 150nm
paint poly

# create the drain and source terminals of the nMOS transistor.
# place local interconnect (li) in the diffusions and then contact the
# n-diffusions with the local interconnect (ndc).
# drain side:
box size 0 0
box position 200nm 100nm
box size 400nm 800nm
paint li
box size 0 0
box position 300nm 150nm
box size 200nm 700nm
paint ndc

# source side:
box size 0 0
box position 200nm 100nm
box size 400nm 800nm
select area
copy w 650nm

# tap the body terminal of the nMOS transistor
# place psubstrate diffusion (psd) and local interconnect
# (li) and contact them together (psc)
box size 0 0
box position -850nm 0nm
box size 400nm 1000nm
paint psd
box size 0 0
box position -850nm 900nm
box size 400nm -800nm
paint li
box size 0 0
box position -750nm 850nm
box size 200nm -700nm
paint psc

#draw the PMOS transistor
#1. select and copy the nmos transistor
box size 0 0
box position -900nm 1150nm
box size 1550nm -1300nm
select area
copy north 3000nm

# zoom to full view
view

# 2. double the width of the transistor
copy down 1000nm

# 3. Wrap n-well around --> magic turns the nMOS into a pMOS
box size 0 0
box position -1050nm 4200nm
box size 1850nm -2400nm
paint nwell

# draw ground and power rails (metal 1)
box size 0 0
box position -1050nm -150nm
box size 1850nm -300nm
paint metal1
select area
copy up 4450nm
