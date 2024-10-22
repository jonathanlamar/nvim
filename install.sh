#!/usr/bin/env bash

# Where is this script located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
NVIMDIR=$HOME/.config/nvim

#==============
# Install virtual environment
#==============

if ! command -v pyenv &> /dev/null; then
    echo "pyenv is not installed. Please install pyenv and run this script again."
    exit 1
fi

PYTHON_VERSION="3.10.14"

if pyenv versions --bare | grep -q "^${PYTHON_VERSION}$"; then
    echo "Python version ${PYTHON_VERSION} is already installed."
else
    echo "Python version ${PYTHON_VERSION} is not installed. Installing..."
    yes | pyenv install "${PYTHON_VERSION}"
    if [ $? -eq 0 ]; then
        echo "Python version ${PYTHON_VERSION} installed successfully."
    else
        echo "Failed to install Python version ${PYTHON_VERSION}."
        exit 1
    fi
fi

VENV_NAME="neovim"
REQUIREMENTS_FILE="requirements.txt"

if pyenv virtualenvs | grep -q "${VENV_NAME}"; then
    echo "Virtual environment '${VENV_NAME}' already exists.  Please remove it and run this script again."
    exit 1
fi

echo "Creating virtual environment '${VENV_NAME}'..."
pyenv virtualenv "${PYTHON_VERSION}" "${VENV_NAME}"
    
if [ $? -eq 0 ]; then
    echo "Virtual environment '${VENV_NAME}' created successfully."
            
    if [ -f "${REQUIREMENTS_FILE}" ]; then
        echo "Installing requirements from '${REQUIREMENTS_FILE}'..."
        eval "$(pyenv init -)" # Loads pyenv-virtualenv into the shell
        pyenv activate "${VENV_NAME}" && pip install -r "${REQUIREMENTS_FILE}"
                                
        if [ $? -eq 0 ]; then
            echo "Requirements installed successfully."
        else
            echo "Failed to install requirements."
            exit 1
        fi
    else
        echo "No requirements file found: '${REQUIREMENTS_FILE}'."
        exit 1
    fi
else
    echo "Failed to create virtual environment '${VENV_NAME}'."
    exit 1
fi

#==============
# Make sure old neovim config is not present.
#==============

if [ -d $NVIMDIR ]; then
    echo "Existing neovim config found.  Please remove it and rerun this script."
    exit 1
fi

#==============
# Create symlinks in the home folder
#==============

ln -sf $SCRIPT_DIR $NVIMDIR
echo "Created the following symlinks in $HOME: $NVIMDIR -> $SCRIPT_DIR"

#==============
# And we are done
#==============
echo -e "\n====== All Done!! ======\n"
echo "Please start neovim and let all plugins and treesitter parsers install."
