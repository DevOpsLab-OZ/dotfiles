#!/bin/bash

# Dotfiles 설치 스크립트

# 색상 코드 정의
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 로그 출력 함수
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# 실행 상태 확인 함수
check_status() {
    if [ $? -eq 0 ]; then
        log_success "$1 완료"
        return 0
    else
        log_error "$1 실패"
        return 1
    fi
}

# 파일별 백업 함수
create_backup() {
    local file=$1
    local backup_file="${file}.bak.$(date +%Y%m%d%H%M%S)"
    
    if [ -f "$file" ] || [ -L "$file" ]; then
        log_info "$file 백업 중..."
        cp -f "$file" "$backup_file"
        check_status "$file 백업"
    fi
}

echo -e "${BLUE}===== Dotfiles 설치 시작 =====${NC}"

# .zshrc 백업 및 링크 생성
log_info ".zshrc 설정 중..."
create_backup "$HOME/.zshrc"
ln -sf $(pwd)/.zshrc ~/.zshrc
check_status ".zshrc 링크 생성"

# .gitconfig 백업 및 링크 생성
log_info ".gitconfig 설정 중..."
create_backup "$HOME/.gitconfig"
ln -sf $(pwd)/.gitconfig ~/.gitconfig
check_status ".gitconfig 링크 생성"

# VS Code 설정 디렉토리가 있으면 링크 생성
if [ -d "$(pwd)/.vscode" ]; then
  mkdir -p ~/.vscode
  
  log_info "VS Code 설정 중..."
  create_backup "$HOME/.vscode/settings.json"
  ln -sf $(pwd)/.vscode/settings.json ~/.vscode/settings.json
  check_status "VS Code 설정 링크 생성"
else
  log_warning "VS Code 설정 디렉토리가 없습니다. 링크 생성을 건너뜁니다."
fi

log_success "Dotfiles 설치 완료!"
