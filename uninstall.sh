#!/usr/bin/env bash

function usageFunction() {
    echo -e "EXPLANATION: Uninstalls the neovim config"
    echo -e "USAGE:"
    echo -e "uninstall [--skip-python-pkgs]"
    echo -e "    OPTIONS"
    echo -e "        -p|--skip-python-pkgs : Whether to skip uninstalling python packages.  Optional, defaults to false."
    echo -e "        -h|--help             : prints this message."
}

SKIP_PYTHON_PKGS="false"
while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            usageFunction
            exit 0;;
        -p|--skip-python-pkgs)
            SKIP_PYTHON_PKGS="true"
            shift;;
        -*|--*)
            echo "Unknown option $1"
            exit 1;;
        *)
    esac
done

rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.config/nvim
rm -rf ~/.cache/nvim
rm -rf ./lazy-lock.json

if [ "$SKIP_PYTHON_PKGS" == "false" ]; then
    conda env remove -n neovim
fi
