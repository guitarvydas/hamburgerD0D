prep=~/tools/pre/pre
d2f=`pwd`/d2f
d2fbash=${d2f}/d2f.bash
sedexec=`which sed`
sortexec=`which sort`
testbench.js : testbench.drawio
	${d2fbash} testbench.drawio ${prep} ${d2f} ${sedexec} ${sortexec}

