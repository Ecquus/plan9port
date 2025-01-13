#!/bin/bash -e

if [ "$1" = "-h" ]; then
	p=`basename $0`
	cat <<EOF
NAME
	$p

SYNOPSYS
	$p [-h]

DESCRIPTION
	$p comments text from stdin by prepending a '#' to
	every line; resulting output on stdout.
EOF
	exit 0
fi

sed "s/^/# /g"
