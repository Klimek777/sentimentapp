# PL Dokumentacja 

## Prezentacja

![sentiment_mockup](https://user-images.githubusercontent.com/90191027/231772360-91537aff-3df4-463b-8d78-877852df7371.png)


## 1. Charakterystyka oprogramowania:
- Nazwa skrócona: `RedditThoughts`
- Nazwa pełna: `Aplikacja do analizy sentymentu 100 trendujących tytułów w danym subbredicie`
- Krótki opis z wskazaniem celów: 
   Aplikacja `RedditThoughts` ma na celu przeprowadzić analizę sentymentu 100 ostatnich tytułów postów w subreddicie wyszukanym przez słowo wpisane przez użytkownika. Backend aplikacji napisany jest w języku Python, używa bibliotek takich jak `praw`, `transformers - AutoTokenizer`, `AutoModelForSequenceClassification`, `scipy.special - softmax`, `flask - request`, `flask`, `flask_cors - CORS`. Do frontendu użyto technologii Flutter umożliwiającej działanie webowe jak i aplikacje mobilne.

## 2. Prawa autorskie:
- Autorzy: Aplikacja została stworzona przez zespół studentów z UG.
- Warunki licencyjne do oprogramowania wytworzonego przez grupę: MIT

## 3. Specyfikacja wymagań:
### Funkcjonalne:
| Identyfikator | Nazwa | Opis | Priorytet | Kategoria |
| --- | --- | --- | --- | --- |
| `FR-001` | Wyszukiwanie tytułów subredditów | Użytkownik może wpisać wyrażenie, na podstawie którego chce znaleźć ostatnie 100 tytułów na danym subreddicie. | `1` | Funkcjonalne |
| `FR-002` | Analiza sentymentu | Aplikacja powinna wykrywać sentyment trendujących tytułów (pozytywny, neutralny, negatywny). | `1` | Funkcjonalne |
| `FR-003` | Wyświetlanie wyników | Aplikacja powinna wyświetlać wyniki analizy sentymentu w formie procentowej oraz w postaci wykresu. | `1` | Funkcjonalne |

### Poza funkcjonalne:
| Identyfikator | Nazwa | Opis | Priorytet | Kategoria |
| --- | --- | --- | --- | --- |
| `NFR-001` | Bezpieczeństwo danych | Aplikacja musi chronić dane użytkowników przed nieautoryzowanym dostępem. | `1` | Poza funkcjonalne |
| `NFR-002` | Czas odpowiedzi | Aplikacja powinna działać szybko i bezproblemowo. | `2` | Poza funkcjonalne |
| `NFR-003` | Dostępność | Aplikacja powinna być dostępna dla użytkowników korzystających z różnych urządzeń oraz przeglądarek internetowych. | `2` | Poza funkcjonalne |
