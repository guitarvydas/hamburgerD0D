# #!/bin/bash
# # convert a .drawio diagram into a factbase
set -x
target=$1
prep=$2
d2fdir=$3
sed=$4
sort=$5
${prep} '.' '$' $d2fdir/drawio.ohm $d2fdir/drawio.glue --stop=1 --support=$d2fdir/support.js < ${target} \
    | ${prep} '.' '$' $d2fdir/diagram.ohm $d2fdir/diagram.glue --stop=1 --support=$d2fdir/support.js \
    | ${prep} '.' '$' $d2fdir/styleexpander.ohm $d2fdir/styleexpander.glue --stop=1 --support=$d2fdir/support.js \
    | ${prep} '.' '$' $d2fdir/factbase.ohm $d2fdir/factbase.glue --stop=1 --support=$d2fdir/support.js \
    | ${sed} -E -e 's/</\n</g' \
    | ${sort} \
    | ${sed} -E -e '/^[ \t]*$/d' \
	     > fb.pl

