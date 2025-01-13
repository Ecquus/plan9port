#!/bin/bash -e

if [ "$1" = "-h" ]; then
	p=`basename $0`
	cat <<EOF
NAME
	$p

SYNOPSYS
	$p [-h|<winid>]

DESCRIPTION
	$p loads tags in the current window's tagbar for working with
	shell scripts. It takes an optional window id as an argument,
	which defaults to the current window's ID if not specified.

EOF
	exit 0
fi

id="${1:-${winid}}"
tags=" |C.Sh |Uc.Sh"
Tag.Text "${id}"
Write tag "${tags}" "${id}"
