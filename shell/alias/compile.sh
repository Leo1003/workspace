gccansi() {
    gcc -lm -lcrypt -O2 -ansi -o "${1%.*}" $1
}
gcc11() {
    gcc -lm -lcrypt -O2 -std='c11' -o "${1%.*}" $1
}
gpp11() {
    g++ -lm -lcrypt -O2 -std='c++11' -o "${1%.*}" $1
}
gpp14() {
    g++ -lm -lcrypt -O2 -std='c++14' -o "${1%.*}" $1
}
gpp17() {
    g++ -lm -lcrypt -O2 -std='c++17' -o "${1%.*}" $1
}
