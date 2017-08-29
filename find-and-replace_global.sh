#!/bin/bash

sed s/"$1"/"$2"/g "$3" > "new_$3"
