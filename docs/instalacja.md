# Instalacja i konfiguracja integracji Claude z Google Workspace

## Wymagania wstępne

- Zainstalowany Docker
- Konto Google Workspace
- Claude Desktop
- Projekt w Google Cloud z włączonymi odpowiednimi API

## Krok 1: Skonfiguruj projekt w Google Cloud Console

1. Przejdź do [Google Cloud Console](https://console.cloud.google.com/)
2. Utwórz nowy projekt lub wybierz istniejący
3. Włącz następujące API:
   - Gmail API
   - Google Calendar API
   - Google Drive API
   - Google Sheets API
4. Utwórz identyfikator klienta OAuth:
   - Przejdź do "APIs & Services" > "Credentials"
   - Kliknij "Create Credentials" > "OAuth client ID"
   - Wybierz typ aplikacji "Desktop app"
   - Podaj nazwę dla klienta OAuth
   - Kliknij "Create"
5. Pobierz plik JSON z danymi uwierzytelniającymi

## Krok 2: Przygotuj środowisko pracy

Możesz użyć skryptu `restore_config.sh` z tego repozytorium, który automatycznie wykona następujące kroki:

```bash
./scripts/restore_config.sh
```

Alternatywnie, wykonaj te kroki ręcznie:

1. Utwórz katalogi konfiguracyjne:

```bash
mkdir -p ~/.mcp/google-workspace-mcp
mkdir -p ~/Documents/workspace-mcp-files
mkdir -p ~/Library/Logs/Claude
```

2. Przygotuj plik konfiguracyjny dla Claude Desktop:

```bash
mkdir -p ~/.config/Claude/
```

3. Umieść plik JSON z danymi uwierzytelniającymi w katalogu `~/.mcp/google-workspace-mcp`

## Krok 3: Skonfiguruj Claude Desktop

1. Otwórz lub utwórz plik `~/.config/Claude/claude_desktop_config.json`
2. Dodaj konfigurację MCP dla Google Workspace:

```json
{
  "google-workspace-mcp": {
    "command": "docker",
    "args": [
      "run",
      "--rm",
      "-i",
      "-v", "~/.mcp/google-workspace-mcp:/app/config",
      "-v", "~/Documents/workspace-mcp-files:/app/workspace",
      "-e", "GOOGLE_CLIENT_ID",
      "-e", "GOOGLE_CLIENT_SECRET",
      "-e", "LOG_MODE=strict",
      "ghcr.io/aaronsb/google-workspace-mcp:latest"
    ],
    "env": {
      "GOOGLE_CLIENT_ID": "TWOJE_CLIENT_ID",
      "GOOGLE_CLIENT_SECRET": "TWOJE_CLIENT_SECRET"
    },
    "autoApprove": [],
    "disabled": false
  }
}
```

3. Zastąp `TWOJE_CLIENT_ID` i `TWOJE_CLIENT_SECRET` odpowiednimi wartościami z pliku JSON pobranego z Google Cloud Console

## Krok 4: Uruchom Claude Desktop i autoryzuj dostęp

1. Uruchom Claude Desktop
2. W pierwszej konwersacji sprawdź dostęp do usług Google Workspace:

```
Sprawdź, czy mam dostęp do konta Google Workspace.
```

3. Claude poprosi o autoryzację konta Google - kliknij link i postępuj zgodnie z instrukcjami
4. Po autoryzacji, Claude potwierdzi dostęp do konta

## Weryfikacja instalacji

Aby zweryfikować poprawność instalacji, możesz użyć skryptu `validate_config.sh`:

```bash
./scripts/validate_config.sh
```

Alternatywnie, wykonaj proste testy w Claude Desktop:

1. Sprawdź dostęp do Gmail:

```
Sprawdź moją skrzynkę odbiorczą i pokaż 5 ostatnich wiadomości.
```

2. Sprawdź dostęp do Kalendarza Google:

```
Pokaż moje wydarzenia w kalendarzu na następny tydzień.
```

3. Sprawdź dostęp do Google Drive:

```
Pokaż listę moich ostatnich plików z Google Drive.
```

## Rozwiązywanie problemów

Jeśli napotkasz problemy podczas konfiguracji:

1. Sprawdź logi serwera MCP:

```bash
cat ~/Library/Logs/Claude/mcp-server-google-workspace-mcp.log
```

2. Upewnij się, że Docker jest uruchomiony
3. Sprawdź czy plik konfiguracyjny OAuth jest poprawny
4. Zweryfikuj, czy włączyłeś wszystkie wymagane API w projekcie Google Cloud
5. Spróbuj ponownie autoryzować konto Google
