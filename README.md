# PL Dokumentacja 

## Prezentacja

![sentiment_mockup](https://user-images.githubusercontent.com/90191027/231772360-91537aff-3df4-463b-8d78-877852df7371.png)


## 1. Charakterystyka oprogramowania:
- Nazwa skrócona: `RedditThoughts`
- Nazwa pełna: `Aplikacja do analizy sentymentu 100 trendujących tytułów w danym subreddicie`
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
| `NFR-003` | Dostępność | Aplikacja powinna być dostępna dla użytkowników korzystających z różnych urządzeń oraz przeglądarek internetowych. | `2` | Pozafunkcjonalne |
## 4. Architektura rozwoju

Aplikacja `RedditThoughts` została podzielona na stronę backend obsługującą logikę biznesową i łączącą się z api aplikacji Reddit i stronę frontend zapewniającą wyświetlanie widoków dla użytkownika. 

Do obsługi strony backendowej został użyty język `python + flask`, umożliwiający uruchamianie skryptu jako serwer. Do strony frontendowej został wykorzysytany `framework Flutter`. 

Strona frontendowa wysyła żądania bezpośrednio na adres pod którym uruchomiony jest serwer flask ze skryptem umożliwiającym obliczanie analizy sentymentu dla wybrnaego subreddita na platformie Reddit. 

Analiza sentymentu obliczana jest dla 100 najbardziej trendujących wpisów w danym subreddicie dla ostatniego tygodnia od momentu wysłania żądania. 

Obliczona analiza zwracana jest do powłoki frontendowej, gdzie przedstawiana jest użytkownikowi w formie wykresów i licznika. Wykres pokazuje jaki procent stanowią wyrażenia negatywne, neutralne i pozytywne. Natomiast miara licznika oscyluje w granicach -1 i 1. Wynik licznika obliczany jest ze wzoru `((pozytywny sentyment - negatywny sentyment)/( pozytywny sentyment + negatywny sentyment))`

## 5. Architektura uruchomieniowa
Aby uruchomić projekt `RedditThoughts` musimy posiadać zainstalowane następujące technologie: `Flutter + Dart` `Python 3.11.3 ` `Flask 2.3.1` następnie należy podjąć poniższe kroki:
   1. Po pobraniu projektu z GitHub należy otworzyć go w dwóch oknach naszego IDE np. `Visual Studio Code`.
   2. W jednym oknie uruchamiamy plik `main.dart` za pomocą komendy `flutter run`, który powinien wygenerować nam główny interface naszej aplikacji. W przypadku       gdyby projekt nie uruchamiał się prawidłowo należy posłużyć się komendą `flutter pub get` i uruchomić projekt ponownie. 
   3. W odrębym oknie uruchamiamy ten sam projekt, natomiast za pomocą terminala przenosimy się do folderu `redidit_api`. 
   4. Przed włączeniem programu `app.py` konieczne jest zaimportowanie poszczególnych bibliotek.
   5. Biblioteki niezbędne do prawidłowego funkcjonowania aplikacji to: 
      -  `praw` -> `pip install praw`
      - `transformers` -> `pip install tranformers`                  
      - `scipy.special` -> `pip install scipy` 
      - `flask` -> `pip install flask` 
      - `flask.cors` -> `pip install flask-cors`
      
   6. W folderze `redidit_api` należy utworzyć plik `secrets_1.py`.  W nim zaś musimy zainicjować 3 zmienne `client_id` `client_secret` `user_agent` w celu           uzyskania dostępu do `API Reddit`. 
   7. Po spełnieniu wszystkich powyższych wytycznych, za pośrednictwem komendy `python -m flask run ` uruchamiamy server.
## 6. Testy
W ramach sprawdzenia prawidłowego funkcjonowania aplikacji przeprowadzone zostały następujące testy.

1. `test_endpoint` - test mający na celu sprawdzić czy endpoint ‘/’ zwraca domyślną wartośc, którą jest ‘business’
2. `test_custom_query` - test mający na celu sprawdzić czy po podaniu własnej wartości query, zwrócone zostaną odpowiednie wyniki 
3. `test_sentiment_scores` - test mający na celu sprawdzić czy zwracane wyniki są w odpowiednich przedziałach liczbowych
4. `test_model_loading` - test mający na celu sprawdzić czy dane ładowadne są w odpowiedni sposób i zwracane są zgodnie z założeniami
5. `test_response_format` - test mający na celu sprawdzić czy zwracane są dane w odpowiednim formacie
6. `test_sentiment_sums` - test mający na celu sprawdzić czy wyniki wszystkich kategorii dają wspólną sumę jaką jest jeden
