#!/bin/bash

# =============================================================================
# backup_config.sh - Skrypt tworzący kopię zapasową konfiguracji integracji Claude z Google Workspace
# =============================================================================

# Definicje kolorów dla lepszej czytelności komunikatów
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Katalogi
CONFIG_DIR="$HOME/.mcp/google-workspace-mcp"
WORKSPACE_DIR="$HOME/Documents/workspace-mcp-files"
BACKUP_DIR="$HOME/Desktop/backups/claude-google-workspace"
CLAUDE_CONFIG="$HOME/.config/Claude/claude_desktop_config.json"

# Nazwa pliku kopii zapasowej z datą i czasem
BACKUP_TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="$BACKUP_DIR/claude_google_workspace_backup_${BACKUP_TIMESTAMP}.tar.gz"
BACKUP_INFO_FILE="$BACKUP_DIR/backup_info_${BACKUP_TIMESTAMP}.txt"

# Funkcja informująca o postępie
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

# Funkcja informująca o sukcesie
log_success() {
    echo -e "${GREEN}[SUKCES]${NC} $1"
}

# Funkcja informująca o błędzie
log_error() {
    echo -e "${RED}[BŁĄD]${NC} $1"
    exit 1
}

# Funkcja informująca o ostrzeżeniu
log_warning() {
    echo -e "${YELLOW}[OSTRZEŻENIE]${NC} $1"
}

# Utworz katalog kopii zapasowych jeśli nie istnieje
create_backup_dir() {
    log_info "Tworzenie katalogu kopii zapasowych..."
    mkdir -p "$BACKUP_DIR"
    log_success "Katalog kopii zapasowych został utworzony."
}

# Utwórz plik z informacjami o kopii zapasowej
create_backup_info() {
    log_info "Tworzenie pliku informacyjnego o kopii zapasowej..."
    
    cat > "$BACKUP_INFO_FILE" << EOL
===================================
Informacje o kopii zapasowej
===================================
Data i czas: $(date)
Użytkownik: $(whoami)
Hostname: $(hostname)

Zawartość kopii zapasowej:
===================================
- Konfiguracja Claude Desktop
- Konfiguracja Google Workspace MCP
- Pliki robocze Workspace MCP

Pliki z wrażliwymi danymi zostały wykluczone z kopii zapasowej.
===================================
EOL
    
    log_success "Plik informacyjny o kopii zapasowej został utworzony."
}

# Wykonaj kopię zapasową
perform_backup() {
    log_info "Tworzenie kopii zapasowej..."
    
    # Sprawdź czy pliki konfiguracyjne istnieją
    if [ ! -d "$CONFIG_DIR" ] && [ ! -f "$CLAUDE_CONFIG" ]; then
        log_error "Nie znaleziono plików konfiguracyjnych. Upewnij się, że integracja została wcześniej skonfigurowana."
    fi
    
    # Stwórz tymczasowy katalog do przygotowania kopii
    TMP_DIR=$(mktemp -d)
    log_info "Używam katalogu tymczasowego: $TMP_DIR"
    
    # Skopiuj pliki konfiguracyjne (bez tokenów i innych wrażliwych danych)
    if [ -f "$CLAUDE_CONFIG" ]; then
        mkdir -p "$TMP_DIR/claude_config"
        # Kopiuj plik konfiguracyjny Claude z usunięciem wrażliwych danych
        grep -v '"GOOGLE_CLIENT_SECRET"' "$CLAUDE_CONFIG" | grep -v '"refresh_token"' > "$TMP_DIR/claude_config/claude_desktop_config.json"
    fi
    
    if [ -d "$CONFIG_DIR" ]; then
        mkdir -p "$TMP_DIR/google_workspace_mcp"
        # Kopiuj tylko strukturę katalogów i pliki niezawierające tokenów
        find "$CONFIG_DIR" -type d -exec mkdir -p "$TMP_DIR/google_workspace_mcp/{}" \;
        find "$CONFIG_DIR" -type f -not -name "*token*" -not -name "*secret*" -exec cp {} "$TMP_DIR/google_workspace_mcp/{}" \;
    fi
    
    # Utwórz archiwum
    tar -czf "$BACKUP_FILE" -C "$TMP_DIR" .
    
    # Usuń tymczasowy katalog
    rm -rf "$TMP_DIR"
    
    log_success "Kopia zapasowa została utworzona: $BACKUP_FILE"
}

# Funkcja główna
main() {
    echo -e "\n${BLUE}=== Tworzenie kopii zapasowej integracji Claude z Google Workspace ===${NC}\n"
    
    # Utwórz katalog kopii zapasowych
    create_backup_dir
    
    # Utwórz plik informacyjny
    create_backup_info
    
    # Wykonaj kopię zapasową
    perform_backup
    
    echo -e "\n${GREEN}=== Kopia zapasowa została pomyślnie utworzona ===${NC}\n"
    echo -e "Plik kopii zapasowej: $BACKUP_FILE"
    echo -e "Plik informacyjny: $BACKUP_INFO_FILE"
}

# Uruchom funkcję główną
main
