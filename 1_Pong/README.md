# Pong

![](https://i.ytimg.com/vi/e4VRgY3tkh0/hqdefault.jpg)

Pong este un joc video din 1972 dezvoltat de Atari care simuleaza un joc de tenis sau tenis de masă. Acesta a fost un mare hit pana in 1976 existand zeci de versiuni de la mai multe companii pentru arcade si console. Companiile care faceau versiuni de pong schimbau putin sau foarte mult ca sa nu se asocieze cu Atari de exemplu: Pong-Tron, Super pong , Super pong ten, Pong double, etc.
## Motivatie
In general pentru jocuri se incearca abstractizarea tipurilor de date pentru a fi mai usor de lucrat cu ele. Aceasta abstractizare se face cel mai bine prin *clase*. Puteti sa va ganditi la un programator novice care vrea sa ruleze un joc. Cel mai intuitiv pentru el este ca clasa ```Game``` sa ascunda alte detalii de implementare si sa ii puna la dispozitie programatorului doua metode ```run()``` si ```stop()```. Acest concept o sa va ajute si pe durata acestui laborator. **Tineti minte,** cu cat un obiect este mai izolat, cu atat este mai usor de testat!
## Precizari de implementare
### Game
  Clasa in care se va intampla toata actiunea se numeste ```Game```. Aceasta pune la dispozitia programatorului, dupa instantiere, o singura metoda ```run()``` care va porni efectiv jocul.
  * Functia ```run()``` este o bucla infinita ce contine logica jocului, dupa modelul predat la curs (input, update, render).
  * Constructorul clasei ```Game``` va trebui sa faca setarile initiale pentru a asigura functionalitatea modului ```Pygame```
  
### GameObject
  Este o clasa model (abstracta) pentru toate celelalte clase ce o vor mosteni.
  * Constructorul contine cateva campuri esentiale pentru existenta unui obiect:
    * ```position``` - pereche de coordonate ```[x, y]```.
    * ```game``` - referinta la instanta jocului in care a aparut obiectul.
    * ```velocity``` - viteza cu care se misca obiectul. Pereche de coordonate ```[vx, vy]```.
    * ```dimensions``` - pereche de jumatati ale dimensiunii obiectului. Daca obiectul are ```width=50``` si ```height=100```, ```dimensions``` va fi definit de perechea ```[25, 50]```.
  * Functiile ```draw()```, ```update()``` si ```collidesWith()``` vor fi suprascrise se instante.
    
  
## Task 1 - Getting comfy
  Ne vom ocupa de fereastra jocului si initializari. 
  1. In constructorul clasei ```Game``` creati o fereastra de dimensiune ```(WIDTH, HEIGHT)``` cu numele *Pong Multiplayer*. **Aveti** variabilele ```WIDTH``` si ```HEIGHT``` deja definite! Salvati fereastra in variabila ```self.window``` intrucat vom avea nevoie de ea mai tarziu.
  2. Creati instante pentru variabilele ```paddleLeft```, ```paddleRight``` si ```ball```, urmarind constructorii fiecarei clase. 
      * Paddle-ul din stanga se va regasi la ```INITIAL_LEFT_POSITION``` si va avea dimensiunea ```HALF_PAD_WIDTH```, ```HALF_PAD_HEIGHT```, variabile **deja** existente. Similar si pentru paddle-ul din dreapta.
      * Mingea se va afla initial in centrul ecranului si va avea dimensiunea definita de ```BALL_RADIUS```, variabila **deja** existenta!
      * **Hint**: ```Paddle/Ball(game, position, dimension)```.
  3. Creati instanta pentru clasa ```Game```, porniti jocul si verificati ca fereastra a pornit corect.
  
## Task 2 - Little artists
  Ne vom ocupa cu desenatul obiectelor.
  1. In metoda ```draw()``` din clasa ```Game```:
      * Colorati fundalul negru.
      * Toate obiectele din scena se afla in lista ```gameObjects``` a clasei ```Game```. Desenati toate obiectele din aceasta lista apeland ```draw()```.
      * Setati *frame rate-ul* la ```60``` FPS.
      * Notificati display-ului ca frame-ul este desenat si trebuie rendat.
      * Testati ca terenul si scorul sunt rendate.
  2. Implementati metoda ```draw()``` din ```Ball```.
      * Ball-ul este un cerc de raza ```BALL_RADIUS```. Centrul lui (pozitia) trebuie sa fie centrul cercului desenat.

## Task 3 - Let's get moving
   Ne vom asigura ca mingea se misca corespunzator.
   1. Calculati noua pozitie a mingii la fiecare ```update()```. La fiecare chemare a functiei, adaugati ```velocity``` peste pozitia curenta. **Faceti cast la ```int``` vitezei inainte sa o adaugati.**
   2. Atunci cand mingea loveste marginea de sus sau de jos, ea trebuie reflectata. **Asigurati-va** ca mingea nu iese din ecran. **Urmariti exemplul** pentru cand mingea atinge lateralele ecranului.
   
## Task 4 - Gathering input
  Vom lua inputul de la tastatura.
  Primul jucator (cel din stanga) va controla paddle-ul cu tastele ```W```, ```A```, ```S```, ```D```.
  Cel de-al doilea jucator (cel din dreapta) va controla peddle-ul din sageti.
  Iterati prin fiecare eveniment si verificati daca tipul acestuia este ```KEYUP``` sau ```KEYDOWN```. Daca este de primul tip va trebui sa opriti miscarea paddle-ului (already done), altfel, trebuie sa miscati paddle-ul in sus sau in jos cu functiile
      ```Paddle.stop()```,
      ```Paddle.moveUp()```,
      ```Paddle.moveDown()```.
   
## Task 5 - Feeling the ball
  Vom trata coliziunile dintre minge si padele.
  Functia ```collidesWith(other)``` testeaza daca doua obiecte sunt in coliziune (obiectul *curent* si cel *other*). Gasiti o formula care tine cont de pozitia celor doua obiecte si forma lor (toate obiectele au forma "fizica" teoretica de dreptunghi, inclusiv mingea) si care sa returneze ```True``` cand obiectele sunt in coliziune si ```False``` cand nu sunt.
