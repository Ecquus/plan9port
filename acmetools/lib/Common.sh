#!/bin/bash

# Check if the script is being sourced
[[ "${BASH_SOURCE[0]}" == "${0}" ]] && abort "This script can only be sourced!"

function abort() {
    local -r message="${1}"
    echo "${message} Exiting!"
    exit 1
}

function event_origin() { cut -d' ' -f2 <<< "${1}"; }
function event_type() { cut -d' ' -f3 <<< "${1}"; }
function event_addr1() { cut -d' ' -f4 <<< "${1}"; }
function event_addr2() { cut -d' ' -f5 <<< "${1}"; }
function event_extAddr1() { cut -d' ' -f6 <<< "${1}"; }
function event_extAddr2() { cut -d' ' -f7 <<< "${1}"; }
function event_flag() { cut -d' ' -f8 <<< "${1}"; }
function event_textLen() { cut -d' ' -f9 <<< "${1}"; }
function event_text() { cut -d' ' -f10 <<< "${1}"; }
function event_chordArg() { cut -d' ' -f11 <<< "${1}"; }
function event_chordOrigin() { cut -d' ' -f12 <<< "${1}"; }
function event_acmeEvent() {
	local -r origin="$(event_origin "${1}")"
	local -r type="$(event_type "${1}")"
	local -r addr1="$(event_addr1 "${1}")"
	local -r addr2="$(event_addr2 "${1}")"
	echo "${origin}${type}${addr1} ${addr2}"
}
