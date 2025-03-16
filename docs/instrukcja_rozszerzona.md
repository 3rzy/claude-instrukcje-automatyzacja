# ROZSZERZONA INSTRUKCJA KORZYSTANIA Z WIEDZY I AUTOMATYZACJI

## 1. POLECENIA PODSTAWOWE

### 1.1. CZYTANIE WIEDZY Z PLIKÓW CSV
Aby odczytać wiedzę z pliku CSV, wklej na początku czatu:

```
Przeczytaj plik /Users/krzyk/apps/MCP/wiedza/[folder_tematu]/[nazwa_pliku].csv i odpowiedz na moje pytanie o [temat].
```

Przykład:
```
Przeczytaj plik /Users/krzyk/apps/MCP/wiedza/n8n_wiedza/n8n_wiedza.csv i powiedz mi, jakie są różnice między wersjami n8n.
```

### 1.2. SPRAWDZANIE DOSTĘPNYCH NARZĘDZI MCP
Aby sprawdzić wszystkie dostępne narzędzia MCP, wklej:

```
Sprawdź wszystkie dostępne narzędzia MCP i pokaż, z jakich funkcji mogę korzystać w tym czacie.
```

### 1.3. PODSUMOWANIE CZATU W PLIKU CSV
Aby podsumować czat w pliku CSV, użyj dokładnie tej instrukcji:

```
Wykonaj następujące kroki:
1. Przeanalizuj naszą całą rozmowę i wyodrębnij kluczową wiedzę
2. Utwórz plik CSV z kolumnami: Kategoria,Podkategoria,Opis
3. Zapisz ten plik jako /Users/krzyk/apps/MCP/wiedza/[temat]/[temat]_wiedza.csv
4. Utwórz folder jeśli nie istnieje: mkdir -p /Users/krzyk/apps/MCP/wiedza/[temat]/
5. Po zapisaniu pliku, wykonaj komendę: cp /Users/krzyk/apps/MCP/wiedza/[temat]/[temat]_wiedza.csv /Users/krzyk/Desktop/wiedza/[temat]/
6. Upewnij się, że katalog docelowy istnieje: mkdir -p /Users/krzyk/Desktop/wiedza/[temat]/
7. Potwierdź, gdzie zapisano plik i podaj komendę do ręcznego skopiowania

Eksportuj wiedzę na temat [temat].
```

### 1.4. AKTYWACJA LICZNIKA TOKENÓW
Aby aktywować licznik tokenów i długości czatu, wklej DOKŁADNIE ten tekst na początku rozmowy:

```
UWAGA: Na końcu KAŻDEJ swojej odpowiedzi MUSISZ umieścić informację o pozostałych tokenach i długości czatu. 

Format MUSI być dokładnie taki: "💬 [liczba] tokenów | ⚠️ [x%] długości czatu"

Przykład: "💬 185230 tokenów | ⚠️ 65% długości czatu"

To jest ABSOLUTNIE KRYTYCZNE dla mojej pracy! 
Nie możesz tego pominąć ani zmienić formatu!
```

## 2. POLECENIA ROZSZERZONE (AUTOMATYZACJA I DOCS-AS-CODE)

### 2.1. SPRAWDŹ WIEDZĘ PROJEKTU/CZATU
Aby sprawdzić całą dostępną wiedzę projektu, wklej:

```
Sprawdź wiedzę projektu [temat]

Wykonaj następujące kroki:
1. Sprawdź dostępne instrukcje w folderze /Users/krzyk/apps/MCP/wiedza/instrukcje/
2. Sprawdź dostępne pliki CSV w folderze /Users/krzyk/apps/MCP/wiedza/[temat]/
3. Sprawdź dostępne pliki Markdown w folderze /Users/krzyk/apps/MCP/wiedza/[temat]/
4. Podsumuj zawarte informacje i wskaż, jakie obszary są dobrze udokumentowane, a jakie wymagają uzupełnienia
5. Jeśli dostępne są repozytorium GitHub, sprawdź jego strukturę i zawartość
```

### 2.2. STWÓRZ WIEDZĘ W FORMACIE DOCS-AS-CODE
Aby stworzyć dokumentację w stylu docs-as-code, wklej:

```
Stwórz wiedzę na temat [temat] w formacie docs-as-code

Wykonaj następujące kroki:
1. Przeanalizuj naszą całą rozmowę i wyodrębnij kluczową wiedzę
2. Stwórz strukturę dokumentacji w formacie Markdown z podziałem na sekcje:
   - Wprowadzenie i podsumowanie
   - Instalacja i konfiguracja
   - Używanie funkcjonalności
   - Rozwiązywanie problemów
   - Przykłady użycia
   - FAQ
3. Zapisz główny plik README.md w katalogu /Users/krzyk/apps/MCP/wiedza/[temat]/
4. Stwórz osobne pliki .md dla każdej głównej sekcji w katalogu /Users/krzyk/apps/MCP/wiedza/[temat]/docs/
5. Utwórz folder jeśli nie istnieje: mkdir -p /Users/krzyk/apps/MCP/wiedza/[temat]/docs/
6. Dodatkowo utwórz plik CSV z podsumowaniem wiedzy
7. Wykonaj kopię do katalogu: mkdir -p /Users/krzyk/Desktop/wiedza/[temat]/ && cp -r /Users/krzyk/apps/MCP/wiedza/[temat]/* /Users/krzyk/Desktop/wiedza/[temat]/
8. Potwierdź, gdzie zapisano pliki

Pamiętaj:
- Markdown powinien zawierać odpowiednie nagłówki, listy, wyróżnienia i bloki kodu
- Dokumentacja powinna być zorganizowana hierarchicznie
- Pliki powinny zawierać odnośniki do innych powiązanych dokumentów
```

### 2.3. STWÓRZ REPOZYTORIUM GITHUB Z AUTOMATYZACJĄ
Aby stworzyć repozytorium GitHub z automatyzacją, wklej:

```
Stwórz repozytorium dla tematu [temat] z automatyzacją i strukturą docs-as-code

Wykonaj następujące kroki:
1. Utwórz nowe publiczne repozytorium GitHub o nazwie [nazwa_repo]
2. Przygotuj strukturę katalogów:
   - /docs - dokumentacja w formacie Markdown
   - /configs - pliki konfiguracyjne
   - /scripts - skrypty automatyzacyjne
   - /knowledge - baza wiedzy (CSV i Markdown)
3. Dodaj dokumentację w formacie Markdown do katalogu /docs
4. Utwórz skrypty automatyzacyjne:
   - restore_config.sh - skrypt przywracający konfigurację
   - backup_config.sh - skrypt tworzący kopię zapasową konfiguracji
   - validate_config.sh - skrypt sprawdzający poprawność konfiguracji
5. Dodaj szablon plików konfiguracyjnych w /configs (bez wrażliwych danych)
6. Dodaj pliki z wiedzą w formacie CSV i Markdown do katalogu /knowledge
7. Utwórz główny plik README.md z opisem projektu, struktury i instrukcjami
8. Potwierdź utworzenie repozytorium i podaj link

Pamiętaj:
- Wszystkie wrażliwe dane (klucze, tokeny, hasła) zastąp placeholderami
- Skrypty powinny obsługiwać błędy i zawierać komunikaty dla użytkownika
- Dokumentacja powinna zawierać czytelne instrukcje korzystania ze skryptów
```

## 3. INICJALIZACJA NOWEGO CZATU (WSZYSTKO NARAZ)
Wklej dokładnie ten tekst na początku każdego nowego czatu:

```
INSTRUKCJA (wykonaj ją dokładnie):

1. Na końcu KAŻDEJ swojej odpowiedzi MUSISZ dodać linię w formacie: "💬 [liczba] tokenów | ⚠️ [x%] długości czatu"

2. Gdy poproszę "Eksportuj wiedzę na temat [temat]", wykonasz te kroki:
   a. Przeanalizujesz całą naszą rozmowę
   b. Wyodrębnisz wszystkie kluczowe informacje
   c. Utworzysz plik CSV z nagłówkiem: Kategoria,Podkategoria,Opis
   d. Utworzysz katalog: mkdir -p /Users/krzyk/apps/MCP/wiedza/[temat]/
   e. Zapiszesz plik: /Users/krzyk/apps/MCP/wiedza/[temat]/[temat]_wiedza.csv
   f. Utworzysz katalog docelowy: mkdir -p /Users/krzyk/Desktop/wiedza/[temat]/
   g. Skopiujesz plik: cp /Users/krzyk/apps/MCP/wiedza/[temat]/[temat]_wiedza.csv /Users/krzyk/Desktop/wiedza/[temat]/
   h. Potwierdzisz, gdzie zapisano plik

3. Gdy poproszę "Sprawdź wiedzę projektu [temat]", wykonasz te kroki:
   a. Sprawdzisz wszystkie dostępne pliki instrukcji, CSV i Markdown
   b. Przedstawisz podsumowanie dostępnej wiedzy
   c. Wskażesz obszary dobrze udokumentowane i wymagające uzupełnienia

4. Gdy poproszę "Stwórz wiedzę na temat [temat]", wykonasz te kroki:
   a. Stworzysz dokumentację w formacie docs-as-code (Markdown)
   b. Utworzysz hierarchiczną strukturę dokumentacji z osobnymi plikami .md
   c. Dodatkowo utworzysz plik CSV z podsumowaniem wiedzy
   d. Skopiujesz wszystkie pliki do odpowiednich katalogów

5. Gdy poproszę "Stwórz repozytorium dla tematu [temat]", wykonasz te kroki:
   a. Utworzysz nowe repozytorium GitHub z odpowiednią strukturą
   b. Dodasz dokumentację, skrypty automatyzacji i pliki konfiguracyjne
   c. Utworzysz pliki z wiedzą w formatach CSV i Markdown
   d. Potwierdzisz utworzenie repozytorium i podasz link

6. Gdy poproszę o odczytanie wiedzy, będziesz używać plików z /Users/krzyk/apps/MCP/wiedza/

Odpowiedz "Zrozumiałem, rozszerzone instrukcje zostały wczytane i będę się do nich stosować."
```
