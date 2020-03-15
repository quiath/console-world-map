#!/bin/bash
tr "[{}],\"" "\n\n\n   " | awk -f find_interior.awk

