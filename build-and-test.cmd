@echo off
setlocal

set "UV_VERSION=0.5.14"
set "UV_SYSTEM_PYTHON=0"
set "UV_FROZEN=1"
set "UV_INSTALL_DIR=%~dp0.uv\bin"
set "UV_PYTHON_INSTALL_DIR=%~dp0.uv\python_install"
set "UV_NO_MODIFY_PATH=1"
set "UV_PYTHON_PREFERENCE='only-managed'"

powershell -ExecutionPolicy ByPass -Command "irm https://astral.sh/uv/install.ps1 | iex"

call %UV_INSTALL_DIR%\uv venv || goto :EOF
call %UV_INSTALL_DIR%\uv pip install --requirement requirements.dev.txt --quiet || goto :EOF
call %UV_INSTALL_DIR%\uv run python -m unittest discover -v || goto :EOF
