# KARTA TOŻSAMOŚCI REPOZYTORIUM — claude-instrukcje-automatyzacja
<!-- HYDRA_IDENTITY_CARD_V1 -->
> **Status:** `HISTORICAL`  
> **Ostatnia weryfikacja:** `2026-11-24` (ETAP P1 / HYDRA-CLEANUP-REPO-CONSISTENCY-20261124)  
> **Owner:** 3rzy (Krzyk)  
> **Źródło prawdy (SoT):** ekosystem Hydra Core.  
> **Rola w ekosystemie:** Wczesna biblioteka instrukcji i szablonów scaffoldingowych.  
> **Cel:** Automatyzacja pracy z Claude w metodyce docs-as-code — instrukcje, skrypty i struktura projektów z marca 2025.  
> **Stan obecny (CURRENT):** Head commit c3e4e077 (2025-03-16); repozytorium publiczne; 5 elementów w katalogu głównym (README.md, configs, docs, knowledge, scripts).  
> **Kierunek docelowy (TARGET):** Zabezpieczenie wartościowych szablonów docs-as-code i skryptów powłoki, a następnie archiwizacja na GitHubie.  
> **Zależności:** Bash, wczesne wersje Claude 3.5 Sonnet (stan na marzec 2025).  
> **Supersedes:** Brak.  
> **Superseded by:** centralny moduł skilli i połączeń Hydry (narzędzia/skille) oraz rdzeń ekosystemu Hydra (standardy).  
> **Status komponentów (REUSE):** `EXTRACT_AND_ARCHIVE`  
> **Rekomendacja:** PROPOSED_ARCHIVE_AFTER_EXTRACTION (Archiwizacja na GitHubie po zabezpieczeniu wzorców).  
> **Wykryte konflikty:** Instrukcje opierają się na założeniach z marca 2025 i nie uwzględniają środowiska orkiestracji Orca, Kanbana Collattice ani nadrzędnej reguły HYDRA_KANBAN_FIRST_V1.  

### Klocki i komponenty do ponownego użycia (REUSE):
- Szablony dokumentacji w docs/
- Skrypty pomocnicze w scripts/ (np. konfiguratory środowiska)
- Wzorce struktury projektów docs-as-code

---

## HISTORICAL / SUPERSEDED CONTENT (ORYGINALNA TREŚĆ README)
> [!NOTE]
> Poniższa treść README została w 100% zachowana w celach archiwalnych i ewidencyjnych.
> Wszystkie wcześniejsze instrukcje wykonawcze należy interpretować przez pryzmat powyższej Karty Tożsamości,
> reguły `HYDRA_KANBAN_FIRST_V1` w `ekosystem Hydra Core` oraz tablicy Kanbana Collattice (`[adres wewnętrzny]`).

# Claude - Rozszerzone Instrukcje z Automatyzacją

To repozytorium zawiera rozszerzone instrukcje dla Claude z automatyzacją i strukturą docs-as-code. Jest to kompleksowe rozwiązanie do zarządzania wiedzą i automatyzacją projektów integrujących Claude z Google Workspace.

## Struktura repozytorium

- `/docs` - dokumentacja w formacie Markdown
- `/configs` - pliki konfiguracyjne (szablony)
- `/scripts` - skrypty automatyzacyjne
- `/knowledge` - baza wiedzy (CSV i Markdown)

## Dostępne polecenia

### Polecenia podstawowe

- Czytanie wiedzy z plików CSV
- Sprawdzanie dostępnych narzędzi MCP
- Podsumowanie czatu w pliku CSV
- Aktywacja licznika tokenów

### Polecenia rozszerzone (automatyzacja i docs-as-code)

- Sprawdzanie wiedzy projektu/czatu
- Tworzenie wiedzy w formacie docs-as-code
- Tworzenie repozytorium GitHub z automatyzacją

Szczegółowe instrukcje znajdują się w pliku `/docs/instrukcja_rozszerzona.md`.
