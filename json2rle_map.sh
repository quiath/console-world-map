#!/bin/bash
tr "[{}],\"" "\n\n\n   " | awk -v gen_points=1 -f find_interior.awk | awk -f rle2.awk
printf "\n"
