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

# 명령행 인자 및 환경 변수 처리
FROM_SETUP=false

for arg in "$@"; do
    case $arg in
        --from-setup)
            FROM_SETUP=true
            log_info "dev-setup에서 호출되었습니다."
            ;;
    esac
done

# dev-setup으로부터 설정 가져오기
if [ "$FROM_SETUP" = true ]; then
    if [ -n "$SETUP_GIT_NAME" ]; then
        log_info "dev-setup에서 Git 사용자 이름 가져옴: $SETUP_GIT_NAME"
        GIT_USER_NAME="$SETUP_GIT_NAME"
    fi
    
    if [ -n "$SETUP_GIT_EMAIL" ]; then
        log_info "dev-setup에서 Git 이메일 가져옴: $SETUP_GIT_EMAIL"
        GIT_USER_EMAIL="$SETUP_GIT_EMAIL"
    fi
    
    if [ -n "$SETUP_ZSH_THEME" ]; then
        log_info "dev-setup에서 Zsh 테마 가져옴: $SETUP_ZSH_THEME"
        ZSH_THEME_NAME="$SETUP_ZSH_THEME"
    fi
fi

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

# 단독 실행 시 dev-setup 안내
if [ "$FROM_SETUP" = false ]; then
    echo -e "${YELLOW}참고:${NC} 이 스크립트는 dev-setup 저장소와 함께 사용하면 더 완벽한 설정이 가능합니다."
    echo -e "전체 개발 환경 설정을 원하시면 다음 명령어를 사용하세요:"
    echo -e "${BLUE}git clone https://github.com/DevOpsLab-OZ/dev-setup.git && cd dev-setup && ./setup.sh${NC}"
    echo
    read -p "계속 진행하시겠습니까? [Y/n] " answer
    if [[ ! "$answer" == "" && ! "$answer" =~ ^[Yy]$ ]]; then
        log_info "설치가 취소되었습니다."
        exit 0
    fi
fi

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
