# SCons
alias sclean="scons --clean"
alias sunit="scons unittest"
alias sios="./scripts/xcode.py ios && open ./src/interface/iphone/Geekbench.xcodeproj"
scw() {
    cd $(git rev-parse --show-toplevel)
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
alias sdebug="./debug.x86_64/geekbench_x86_64"
alias sios="./scripts/xcode.py ios"
alias sioso="open src/interface/iphone/Geekbench.xcodeproj"
alias lldebug="lldb -- debug.x86_64/geekbench_x86_64"
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
alias sdebug32="./debug.x86_64/geekbench"
alias sandr="./scripts/package.py android"
sandrp() {
    cd "$(git rev-parse --show-toplevel)"
    if [[ ! -d "dist/Geekbench-4.0.0-Android" ]]; then
        >&2 echo "Build Android first, using ./scripts/package.py android"
        return 1
    fi
    cd "dist/Geekbench-4.0.0-Android"
    for file in geekbench{.plar,_armv7}; do
        echo "Pushing $file"
        adb push -p $file /data/local/tmp/
    done
    adb shell chmod 755 /data/local/tmp/geekbench_armv7
    cd -
}
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
diff-img() {
    if [ "$#" -ge 2 ]; then
        compare "$1" "$2" -compose src ${3:-diff.png}
    fi
}
