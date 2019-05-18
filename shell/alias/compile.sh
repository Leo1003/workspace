get_output_name() {
    for arg in "$@"
    do
        if [ -f $arg ]; then 
            echo "${arg%.*}"
            return
        fi
    done
    echo "a.out"
}

gccansi() {
    name=$(get_output_name "$@")
    gcc -lm -lcrypt -O2 -ansi -o "$name" "$@"
}
gcc99() {
    name=$(get_output_name "$@")
    gcc -lm -lcrypt -O2 -std='c99' -o "$name" "$@"
}
gcc11() {
    name=$(get_output_name "$@")
    gcc -lm -lcrypt -O2 -std='c11' -o "$name" "$@"
}
gpp11() {
    name=$(get_output_name "$@")
    g++ -lm -lcrypt -O2 -std='c++11' -o "$name" "$@"
}
gpp14() {
    name=$(get_output_name "$@")
    g++ -lm -lcrypt -O2 -std='c++14' -o "$name" "$@"
}
gpp17() {
    name=$(get_output_name "$@")
    g++ -lm -lcrypt -O2 -std='c++17' -o "$name" "$@"
}
