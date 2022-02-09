## My little library miscellaneous helpers
## created by https://github.com/peedy2495

# Check all reqired shell commands to perform some previous actions;
# CheckCmdReqirements [cmd1] [cmd2] ... [cmdn]
# Returns: exit status; 0 = all commands found; 1 = one or more of given commands not found
CheckCmdReqirements() {
    RET=0
    for CMD in "$@"; do
	    if $(command -v $CMD >/dev/null); then
            continue
        else
            echo "$CMD : required dependency not found."
            RET=1
        fi
    done
    if [ $RET -eq 1 ]; then
        return 1
    fi
}