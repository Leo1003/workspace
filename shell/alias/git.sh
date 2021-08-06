alias gstre='git stash show -p | git apply --reverse'

git-ls-all-objects() {
    local obj_path="$(git rev-parse --git-path objects)"

    # packed objects
    find "$obj_path/pack" -regextype posix-extended -regex '.*pack-([0-9a-f]*).idx' -exec cat '{}' \; | git show-index | cut -f 2 -d ' '

    # loose objects
    find "$obj_path" -regextype posix-extended -regex '.*[0-9a-f]{2}/([0-9a-f]*)' | rev | cut -d '/' -f 1-2 | rev | tr -d '/'
}

_filter_object_type() {
    git-ls-all-objects | while IFS= read -r obj; do
        obj_type="$(git cat-file -t $obj)"
        if [ "$obj_type" = "$1" ]; then
            echo "$obj"
        fi
    done
}

git-ls-all-commits() {
    _filter_object_type "commit"
}

git-ls-all-trees() {
    _filter_object_type "tree"
}

git-ls-all-blobs() {
    _filter_object_type "blob"
}

git-ls-all-tags() {
    _filter_object_type "tag"
}

git-find-tree-in-commits() {
    local searchfor="${1:?No tree hash provided.}"
    local startpoints="${2:-HEAD}"

    if [ "$startpoints" = "--" ]; then
        cat
    else
        git rev-list $startpoints
    fi | while read commithash; do
        if git cat-file -p $commithash | grep "tree $searchfor"; then
            echo " -- found at $commithash"
        fi
        if git ls-tree -d -r --full-tree $commithash | grep $searchfor; then
            echo " -- found at $commithash"
        fi
    done
}

