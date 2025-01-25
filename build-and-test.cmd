@echo off
setlocal

set "UV_SYSTEM_PYTHON=0"
set "UV_FROZEN=1"
set "UV_INSTALL_DIR=%~dp0.uv\bin"
set "UV_PYTHON_INSTALL_DIR=%~dp0.uv\python_install"
set "UV_NO_MODIFY_PATH=1"
set "UV_PYTHON_PREFERENCE=only-managed"

@REM If this script is run by PWSH it will try to load incompatible modules, as happens in GitHub Actions.
set "PSModulePath="

powershell -ExecutionPolicy ByPass -Command "irm https://astral.sh/uv/0.5.13/install.ps1 | iex" || goto :ERROR

call %UV_INSTALL_DIR%\uv venv || goto :ERROR
call %UV_INSTALL_DIR%\uv pip install --requirement requirements.dev.txt --quiet || goto :ERROR
call %UV_INSTALL_DIR%\uv run python -m unittest discover -v || goto :ERROR


    :ERROR
exit /b %ERRORLEVEL%
