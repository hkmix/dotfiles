# SCons
alias sclean="scons --clean"
alias sunit="scons unittest"
alias sios="./scripts/xcode.py ios && open ./src/interface/iphone/Geekbench.xcodeproj"
scw() {
    tempcmd="scons"
    for var in "$@"; do
        var=$(tr '[:lower:]' '[:upper:]' <<< $var)
        tempcmd="$tempcmd $var=true"
    done
    echo "$tempcmd"
    eval "$tempcmd"
}
alias sca="scw build_metal build_cuda build_opencl"
alias scd="scw debug"
alias stest="./build.x86_64/geekbench_x86_64"
alias sdebug="./debug.x86_64/geekbench_x86_64"
alias sios="./scripts/xcode.py ios"
alias sioso="open src/interface/iphone/Geekbench.xcodeproj"
alias lldebug="lldb -- debug.x86_64/geekbench_x86_64"
stests() {
    if [ "$#" -lt 1 ]; then
        echo "Usage: $0 [section-id]"
    fi
    stest --section $1 "${@:2}"
}
stestsv() {
    if [ "$#" -lt 1 ]; then
        echo "Usage: $0 [section-id]"
    fi
    stest --section $1 --verbose "${@:2}"
}
stestw() {
    if [ "$#" -lt 2 ]; then
        echo "Usage: $0 [section-id]"
    fi
    stest --section $1 --workload $2 "${@:3}"
}
stestwv() {
    if [ "$#" -lt 2 ]; then
        echo "Usage: $0 [section-id]"
    fi
    stest --section $1  --workload $2 --verbose "${@:3}"
}
stestsd() {
    if [ "$#" -lt 3 ]; then
        echo "Usage: $0 [section-name] [device] [section-id]"
    fi
    stest --${1}-device $2 --section $3 "${@:4}"
}
stestsdv() {
    if [ "$#" -lt 3 ]; then
        echo "Usage: $0 [section-name] [device] [section-id]"
    fi
    stest --${1}-device $2 --section $3 --verbose "${@:4}"
}
stestwd() {
    if [ "$#" -lt 4 ]; then
        echo "Usage: $0 [section-name] [device] [section-id] [workload-id]"
    fi
    stest --${1}-device $2 --section $3 --workload $4 "${@:5}"
}
stestwdv() {
    if [ "$#" -lt 4 ]; then
        echo "Usage: $0 [section-name] [device] [section-id] [workload-id]"
    fi
    stest --${1}-device $2 --section $3 --workload $4 --verbose "${@:5}"
}
lldbs() {
    if [ "$#" -lt 1 ]; then
        echo "Usage: $0 [section-id]"
    fi
    lldebug --section $1 --verbose "${@:2}"
}
lldbw() {
    if [ "$#" -lt 2 ]; then
        echo "Usage: $0 [section-id] [workload-id]"
    fi
    lldebug --${1}-device $2 --section $3 --workload $4 --verbose "${@:5}"
}
lldbsd() {
    if [ "$#" -lt 3 ]; then
        echo "Usage: $0 [section-name] [device] [section-id]"
    fi
    lldebug --${1}-device $2 --section $3 --verbose "${@:4}"
}
lldbwd() {
    if [ "$#" -lt 4 ]; then
        echo "Usage: $0 [section-name] [device] [section-id] [workload-id]"
    fi
    lldebug --${1}-device $2 --section $3 --workload $4 --verbose "${@:5}"
}
alias stest32="./build.x86_64/geekbench"
alias sdebug32="./debug.x86_64/geekbench"
alias sstat="./build.x86_64/geekbench_x86_64 --ministat --iterations"
alias sstat32="./build.x86_64/geekbench --ministat --iterations"
alias dasm="otool -vt"
alias cleanscores='grep "^  " | sed -e "s/.* \([0-9]\+\) .*/\1/g"'

# Refactoring
find-refactor() {
    if [ "$#" -ge 3 ]; then
        grep -lIR "$2" "$1" | sed 's/.*/"&"/g' | xargs sed -i "s/$2/$3/g"
    fi
}
find-here() {
    if [ "$#" -ge 1 ]; then
        grep -IR "$1" .
    fi
}
find-there() {
    if [ "$#" -ge 2 ]; then
        grep -IR "$2" "$1"
    fi
}
find-herei() {
    if [ "$#" -ge 1 ]; then
        grep -iIR "$1" .
    fi
}
find-therei() {
    if [ "$#" -ge 2 ]; then
        grep -iIR "$2" "$1"
    fi
}
repeat_test_stats() {
    if [ "$#" -ge 2 ]; then
        (clean_repeat $1 ${@:2} 2>&1) | cleanscores | sum_numbers
    fi
}
