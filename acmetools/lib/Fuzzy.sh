#!/bin/bash -eu

SCRIPT_DIR="$(readlink --canonicalize-existing $(dirname $0))"
REPO_DIR="$(cd "${SCRIPT_DIR}" && git rev-parse --show-toplevel)"
source "${REPO_DIR}/acmetools/lib/Common.sh"

OLD_SEARCH_STRING=""

# [[ "${BASH_SOURCE[0]}" != "${0}" ]] && abort "This script can only be sourced!"

function write_search_result() {
	local -r search_result="${1}"
	local -r window_id="${2}"
	To -c "${window_id}" <<< "${search_result}"
	Write addr 1 "${window_id}"
	Write ctl "dot=addr" "${window_id}"
}

function prepare_window() {
	local -r find_function="${1}"
	local -r window_name="${2}"
	Open -n -u "${window_name}"
	window_id="$(Getids "${window_name}")"
	local -r search_result="$("${find_function}" "")"
	Write tag "Fuzzy()" "${window_id}"
	write_search_result "${search_result}" "${window_id}"
	echo "${window_id}"
}

function on_event() {
	local -r find_function="${1}"
	local -r window_id="${2}"
	local -r tag="$(Read tag "${window_id}")"
	local -r search_string="$(grep -oP 'Fuzzy\(\K[^)]*' <<< "${tag}")"
	if [[ "${OLD_SEARCH_STRING}" == "${search_string}" ]]; then
		return
	fi
	OLD_SEARCH_STRING="${search_string}"
	local -r search_result="$("${find_function}" "${search_string}")"
	write_search_result "${search_result}" "${window_id}"
}

function event_loop() {
	local -r find_function="${1}"
	local -r window_id="${2}"
    Read event "${window_id}" | acmeevent | while read e; do
    	if [[ "$(event_origin "${e}")" == "M" ]]; then
    		case "$(event_type "${e}")" in
    			x|X|l|L|r|R)
    				event_acmeEvent "${e}" | 9p write "acme/${window_id}/event"
    				;;
    			d|i)
    				on_event "${find_function}" "${window_id}"
    				;;
    		esac
    	elif [[ "$(event_origin "${e}")" == "K" ]]; then
    		on_event "${find_function}" "${window_id}"
    	fi
    done
}

function run_fuzzy() {
	local -r find_function="${1}"
	local -r window_name="${2}"
	[[ "$(Getids "${window_name}")" != "" ]] && return
	window_id="$(prepare_window "${find_function}" "${window_name}")"
	event_loop "${find_function}" "${window_id}"
}