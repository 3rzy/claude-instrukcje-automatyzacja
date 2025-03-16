#!/bin/bash

# =============================================================================
# validate_config.sh - Skrypt sprawdzający poprawność konfiguracji integracji Claude z Google Workspace
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
CLAUDE_CONFIG="$HOME/.config/Claude/claude_desktop_config.json"

# Liczniki błędów i ostrzeżeń
ERROR_COUNT=0
WARNING_COUNT=0

# Funkcja informująca o postępie
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

# Funkcja informująca o sukcesie
log_success() {
    echo -e "${GREEN}[OK]${NC} $1"
}

# Funkcja informująca o błędzie
log_error() {
    echo -e "${RED}[BŁĄD]${NC} $1"
    ERROR_COUNT=$((ERROR_COUNT + 1))
}

# Funkcja informująca o ostrzeżeniu
log_warning() {
    echo -e "${YELLOW}[OSTRZEŻENIE]${NC} $1"
    WARNING_COUNT=$((WARNING_COUNT + 1))
}

# Sprawdź katalogi
check_directories() {
    log_info "Sprawdzanie katalogów konfiguracyjnych..."
    
    if [ ! -d "$CONFIG_DIR" ]; then
        log_error "Katalog konfiguracyjny Google Workspace MCP nie istnieje: $CONFIG_DIR"
    else
        log_success "Katalog konfiguracyjny Google Workspace MCP istnieje."
    fi
    
    if [ ! -d "$WORKSPACE_DIR" ]; then
        log_warning "Katalog roboczy Workspace MCP nie istnieje: $WORKSPACE_DIR"
    else
        log_success "Katalog roboczy Workspace MCP istnieje."
    fi
}

# Sprawdź plik konfiguracyjny Claude
check_claude_config() {
    log_info "Sprawdzanie konfiguracji Claude Desktop..."
    
    if [ ! -f "$CLAUDE_CONFIG" ]; then
        log_error "Plik konfiguracyjny Claude Desktop nie istnieje: $CLAUDE_CONFIG"
        return
    else
        log_success "Plik konfiguracyjny Claude Desktop istnieje."
    fi
    
    # Sprawdź czy plik jest poprawnym JSON
    if ! jq empty "$CLAUDE_CONFIG" 2>/dev/null; then
        log_error "Plik konfiguracyjny Claude Desktop nie jest poprawnym JSON."
        return
    else
        log_success "Plik konfiguracyjny Claude Desktop ma poprawną strukturę JSON."
    fi
    
    # Sprawdź czy konfiguracja zawiera sekcję google-workspace-mcp
    if ! jq -e '."google-workspace-mcp"' "$CLAUDE_CONFIG" >/dev/null 2>&1; then
        log_error "Brak konfiguracji google-workspace-mcp w pliku Claude Desktop."
        return
    else
        log_success "Konfiguracja google-workspace-mcp znaleziona w pliku Claude Desktop."
    fi
    
    # Sprawdź czy ID klienta i Secret są ustawione (bez ujawniania ich wartości)
    if ! jq -e '."google-workspace-mcp".env.GOOGLE_CLIENT_ID' "$CLAUDE_CONFIG" >/dev/null 2>&1; then
        log_error "Brak GOOGLE_CLIENT_ID w konfiguracji."
    else
        log_success "GOOGLE_CLIENT_ID jest ustawione."
    fi
    
    if ! jq -e '."google-workspace-mcp".env.GOOGLE_CLIENT_SECRET' "$CLAUDE_CONFIG" >/dev/null 2>&1; then
        log_error "Brak GOOGLE_CLIENT_SECRET w konfiguracji."
    else
        log_success "GOOGLE_CLIENT_SECRET jest ustawione."
    fi
}

# Sprawdź obraz Docker
check_docker_image() {
    log_info "Sprawdzanie obrazu Docker..."
    
    # Sprawdź czy Docker jest zainstalowany
    if ! command -v docker &> /dev/null; then
        log_error "Docker nie jest zainstalowany."
        return
    else
        log_success "Docker jest zainstalowany."
    fi
    
    # Sprawdź czy obraz istnieje
    if ! docker images | grep -q "ghcr.io/aaronsb/google-workspace-mcp"; then
        log_warning "Obraz Docker 'ghcr.io/aaronsb/google-workspace-mcp' nie jest lokalnie dostępny."
        log_info "Obraz zostanie pobrany przy pierwszym uruchomieniu."
    else
        log_success "Obraz Docker 'ghcr.io/aaronsb/google-workspace-mcp' jest dostępny lokalnie."
    fi
}

# Funkcja główna
main() {
    echo -e "\n${BLUE}=== Walidacja konfiguracji integracji Claude z Google Workspace ===${NC}\n"
    
    # Sprawdź katalogi
    check_directories
    
    # Sprawdź plik konfiguracyjny Claude
    check_claude_config
    
    # Sprawdź obraz Docker
    check_docker_image
    
    echo -e "\n${BLUE}=== Podsumowanie walidacji ===${NC}"
    if [ $ERROR_COUNT -eq 0 ] && [ $WARNING_COUNT -eq 0 ]; then
        echo -e "\n${GREEN}Wszystkie testy zakończone pomyślnie. Konfiguracja jest poprawna.${NC}\n"
    else
        echo -e "\nZnaleziono ${RED}$ERROR_COUNT błędów${NC} i ${YELLOW}$WARNING_COUNT ostrzeżeń${NC}.\n"
    fi
}

# Uruchom funkcję główną
main
