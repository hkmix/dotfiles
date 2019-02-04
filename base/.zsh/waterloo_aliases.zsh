# Classes
alias cs444="cd ~/Waterloo/CS\ 444"
alias cs451="cd ~/Waterloo/CS\ 451"
alias ece459="cd ~/Waterloo/ECE\ 459"
alias ece457b="cd ~/Waterloo/ECE\ 457B"

function wcd() {
    cd "$HOME/Waterloo Projects/$@"
}

function wup() {
    classes=("cs451" "ece459")
    for class in "${classes[@]}"; do
        printf "\e[97;1m==> Updating %s...\e[0m\n" "$class"
        (cd "$HOME/Waterloo Projects/$class" && git pull)
    done
}
