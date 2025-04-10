#!/bin/bash

# Dotfiles 설치 스크립트

# 심볼릭 링크 생성
ln -sf $(pwd)/.zshrc ~/.zshrc
ln -sf $(pwd)/.gitconfig ~/.gitconfig

# VS Code 설정 디렉토리가 있으면 링크 생성
if [ -d "$(pwd)/.vscode" ]; then
  mkdir -p ~/.vscode
  ln -sf $(pwd)/.vscode/settings.json ~/.vscode/settings.json
fi

echo "Dotfiles 설치 완료!"
