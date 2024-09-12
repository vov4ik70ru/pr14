#!/bin/bash

#есть проблема в именах файлов и директорий с пробелами в названии
#но информации  об этом ни где не нашел

get_size() {
    local path="$1"
    local razmer=$(du -hs "$path" 2>/dev/null | cut -f1)
    echo $razmer
}

faily=$(ls -A)

vova=()
for fail in $faily; do
    razmer=$(get_size "$fail")
    vova+=("$razmer $fail")
done

printf "%s\n" "${vova[@]}" | sort -rh | column -t
