#!/usr/bin/env bash

function installex ()
{
    local arr=("${@}")
    for arg in "${arr[@]}"
    do
        echo "$arg"
        code --install-extension "$arg"
    done
}

function extensions()
{
    local arr="$1"
    bash=("rogalmic.bash-debug" "Remisa.shellman" "lizebang.bash-extension-pack" "foxundermoon.shell-format" "mads-hartmann.bash-ide-vscode" "rpinski.shebang-snippets" "shakram02.bash-beautify" "timonwong.shellcheck")
    powershell=("ms-vscode.powershell")
    cpp=()
    js=("chris-noring.node-snippets" "esbenp.prettier-vscode" "ms-vscode.vscode-typescript-next" "xabikos.JavaScriptSnippets")
    py=("ms-python.python" "ms-python.vscode-pylance")
    docker=("ms-azuretools.vscode-docker")
    ssh=("ms-vscode.remote-explorer" "ms-vscode-remote.remote-ssh-edit" )
    rust=("dustypomerleau.rust-syntax" "rust-lang.rust-analyzer")
    web=("bradlc.vscode-tailwindcss" "yandeu.five-server")
    utils=("alefragnani.project-manager" "icrawl.discord-vscode" "ms-vscode.azure-repos" "firefox-devtools.vscode-firefox-debug")
    git=("donjayamanne.git-extension-pack" "donjayamanne.githistory" "codezombiech.gitignore eamodio.gitlens" "GitHub.remotehub" "ms-vscode.remote-repositories" "mhutchie.git-graph" "ziyasal.vscode-open-in-github")
    php=("DEVSENSE.phptools-vscode")
    theme=("akamud.vscode-theme-onedark" "PKief.material-icon-theme" "miguelsolorio.fluent-icons")
    
    for arg in "${arr[@]}" # into args
    do
        case "$arg" in
            "powershell") installex "${powershell[@]}";;
            "rust") installex "${rust[@]}";;
            "git") installex "${git[@]}";;
            "cpp") installex "${cpp[@]}";;
            "docker") installex "${docker[@]}";;
            "ssh") installex "${ssh[@]}";;
            "web") installex "${web[@]}";;
            "php") installex "${php[@]}";;
            "theme") installex "${theme[@]}";;
            "utils") installex "${utils[@]}";;
            "bash") installex "${bash[@]}";;
            "python") installex "${py[@]}";;
            "javascript") installex "${js[@]}";;
        esac
    done
    
}

#check if no args are provided
if [ $# -eq 0 ]; then
    # usage
    exit 1
fi

EXTENSIONS=

while getopts ":x:" o; do
    case "${o}" in
        x)
            EXTENSIONS=$OPTARG
            extensions "${OPTARG[@]}"
        ;;
        *) ;;
    esac
done

echo "Ext: ${EXTENSIONS}"

args=("$@")

echo "Args passed: ${args[*]}";

