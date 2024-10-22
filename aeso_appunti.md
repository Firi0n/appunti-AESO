# Indice

- [Indice](#indice)
- [Astrazione, disciplina e le tre y](#astrazione-disciplina-e-le-tre-y)
  - [Astrazione digitale](#astrazione-digitale)
- [I sistemi numerici](#i-sistemi-numerici)
  - [Il sistema decimale](#il-sistema-decimale)
    - [Conversione da base b a decimale](#conversione-da-base-b-a-decimale)
    - [Conversione da decimale a base b](#conversione-da-decimale-a-base-b)
  - [Il sistema binario](#il-sistema-binario)
    - [Conversione da binario a base b](#conversione-da-binario-a-base-b)
    - [Conversione da una base b a binario](#conversione-da-una-base-b-a-binario)
    - [Complemento a 2](#complemento-a-2)
    - [Somma e sottrazione binaria](#somma-e-sottrazione-binaria)
  - [Altre basi utili](#altre-basi-utili)
- [Porte logiche](#porte-logiche)
  - [Porte a un ingresso](#porte-a-un-ingresso)
  - [Porte a due o più ingressi](#porte-a-due-o-più-ingressi)
- [Transistor CMOS](#transistor-cmos)
- [Reti logiche combinatorie](#reti-logiche-combinatorie)
  - [Espressioni booleane](#espressioni-booleane)
    - [Teminologia](#teminologia)
    - [Precedenza operatori](#precedenza-operatori)
    - [Somma di prodotti](#somma-di-prodotti)
    - [Prodotto di somme](#prodotto-di-somme)
    - [Postulati](#postulati)
  - [Linee guida schema](#linee-guida-schema)
  - [Le mappe di karnaugh](#le-mappe-di-karnaugh)
    - [Funzionamento](#funzionamento)
    - [Indifferenze](#indifferenze)
  - [Blocchi costitutivi combinatori](#blocchi-costitutivi-combinatori)
    - [Multiplexer](#multiplexer)
    - [Decoder](#decoder)
  - [Temporizzazione](#temporizzazione)
    - [Alee](#alee)
- [Reti logiche sequenziali](#reti-logiche-sequenziali)
  - [Latch e flip-flop](#latch-e-flip-flop)
    - [Latch SR](#latch-sr)
    - [Latch D](#latch-d)
    - [Flip-flop D](#flip-flop-d)
    - [Registro](#registro)
    - [Flip-flop con abilitazione](#flip-flop-con-abilitazione)
  - [Reti sequenziali sincrone](#reti-sequenziali-sincrone)
  - [Macchine a stati finiti](#macchine-a-stati-finiti)
  - [Temporizzazione nella logica sequenziale](#temporizzazione-nella-logica-sequenziale)
  - [Sincronizzatori](#sincronizzatori)
  - [Parallelismo](#parallelismo)
- [](#)

---

# Astrazione, disciplina e le tre y

L'**astrazione** consiste nel nascondere i dettagli non essenziali per mettere in evidenza gli elementi chiave di un sistema, che può essere analizzato a diversi livelli, ciascuno concentrato su aspetti specifici.

Per lavorare in modo più efficiente a livelli più alti di astrazione, si applica la **disciplina**, che limita intenzionalmente le scelte progettuali, rendendo il processo più produttivo.

In questo contesto, la **microarchitettura** svolge un ruolo fondamentale, collegando la logica con l'architettura del calcolatore e traducendo il modello teorico in implementazioni hardware che eseguono le istruzioni in base al punto di vista del programmatore.

Quando si lavora a un determinato livello di astrazione, è utile conoscere i livelli immediatamente superiore e inferiore per comprendere meglio il contesto e l'interazione tra i diversi strati del sistema.

![Computer-Architecture-Layers-Of-Abstraction](https://www.learncomputerscienceonline.com/wp-content/uploads/2022/04/Computer-Architecture-Layers-Of-Abstraction.jpg)

Oltre all'astrazione ci sono altre tre tecniche fondamentali (dette le tre y):

- **Gerarchia:** Divisione di un sistema in moduli in maniera ricorsiva, fino a raggiungere pezzi facili da comprendere.
- **Modularità:** Implementazione dei moduli in maniera tale che abbiano funzioni e interfacce ben de­finite.
- **Regolarità:** Uniformità tra i moduli.

## Astrazione digitale

Una prima astrazione che viene fatta è quella di passare dai sistemi **analogici**, che possono assumere **valori infiniti**, a quelli **digitali**, che possono rappresentare solo **valori discreti**.

Uno dei primi sistemi digitali che utilizzava le variabili con **10** diversi valo­ri era il Motore Analitico di **Charles Babbage**. Babbage ci lavorò dal **1834** fino al **1871**, progettando e tentando di costruire questo calcolatore meccanico.

A differenza della macchina di
Babbage, la maggior parte dei calcolatori elettronici utilizza una rappresenta­
zione binaria, più facile da distinguere (Due sole tensioni: 0 e 5V). **George Boole** ha sviluppato una logica che opera su variabili bina­rie, nota come **logica Booleana**.

Un programmatore può scrivere codice senza conoscere i dettagli specifici dell'hardware, ma comprendere tali dettagli consente di ottimizzare il software per quel calcolatore.

---

# I sistemi numerici

Un generico **sistema numerico posizionale** è composto da:

- **base (b):** Indica il numero delle **cifre** del sistema numerico;
- **cifre (c):** Simboli del sistema numerico con valore compreso tra $[0;b-1]$. Possono essere combinate per ottenere valori maggiori, dove **$c_i$** indica la cifra in posizione i.
- **peso (i):** il peso è il valore associato alla posizione i ed aumenta spostandosi verso sinistra.

## Il sistema decimale

### Conversione da base b a decimale

Il valore in decimale della cifra **c**, in posizione **i**, è uguale a:

$$c_i = c\cdot b^i$$

Quindi dato **$n_b$**, un numero in **base b** di **k cifre**, il suo valore in decimale è:

$$n_{10}=\sum_{i=0}^{k-1}{c_i\cdot b^i}$$

### Conversione da decimale a base b

La formula precedente consente di convertire un numero scritto in qualunque base in un numero decimale.
Tuttavia, per fare l'opposto, non basta una formula ma serve un procedimento ricorsivo:

Sia **i** l'i-esimo passo del procedimento che va avanti fino a che **$n_{10}$** non è uguale a **0** e la posizione della cifra **c**, allora:

$$
n_{i|10}=\begin{cases}
  n_{10} & i=0\\
  \lfloor\frac{n_{i-1|10}}{b}\rfloor & i>0
\end{cases}
$$

$$c_{i|b} = {n_{i|10}\bmod b}$$

$$n_b=\sum_{i\in I} c_i\cdot 10^i$$

## Il sistema binario

### Conversione da binario a base b

...

### Conversione da una base b a binario

...

### Complemento a 2

...

### Somma e sottrazione binaria

...

## Altre basi utili

- **Ottale** $[0:7]$;
- **Esadecimale** $[0;9]\cup[A;F]$: Usato principalmente per la gestione dei colori RGB.

# Porte logiche

## Porte a un ingresso

| A   | BUF | NOT      |
| --- | --- | -------- |
|     |     | $\neg A$ |
| 0   | 0   | 1        |
| 1   | 1   | 0        |

## Porte a due o più ingressi

| A   | B   | AND        | OR        | XOR         |
| --- | --- | ---------- | --------- | ----------- |
|     |     | $A\land B$ | $A\lor B$ | $A\oplus B$ |
| 0   | 0   | 0          | 0         | 0           |
| 0   | 1   | 0          | 1         | 1           |
| 1   | 0   | 0          | 1         | 1           |
| 1   | 1   | 1          | 1         | 0           |

![](https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fas1.ftcdn.net%2Fv2%2Fjpg%2F05%2F02%2F63%2F52%2F1000_F_502635240_S7hotQTlARZJiY3s7S9bkqlQSsUI5R33.jpg&f=1&nofb=1&ipt=392ab8da7b6b678d21fe31115eed59b4b0105b2d0538591416fb638cde166196&ipo=images)

# Transistor CMOS

...

# Reti logiche combinatorie

Una rete può essere vista come un insieme di **ingressi** e **uscite**, messe in relazione da una **specifica funzionale** e con una **specifica di temporizzazione**, che descrive il **ritardo** tra il cambio degli **ingressi** e la risposta delle **uscite**.

Esse sono formate da **nodi** ed **elementi**, gli **elementi** sono a loro volta delle **reti**, mentre, i **nodi** sono **contatti elettrici** che si suddividono in: **Ingressi**, **uscite** e **nodi interni**.

Le reti si dividono in:

- **combinatorie**: le uscite dipendono solo dagli **ingressi attuali**;
- **sequenziali**: le uscite dipendono dai valori degli **ingressi attuali e precedenti**, gli stati precedenti vengono salvati in una memoria.

La **specifica di temporizzazione** delle **reti combinatorie** consiste in un **limite superiore** e un **limite inferiore** sul **ritardo** tra **ingressi** e **uscite**.

Una rete è combinatoria se consiste di elementi circui­tali interconnessi che presentano le seguenti caratteristiche:

- ogni elemento circuitale è di per sé combinatorio;
- ogni nodo della rete è un ingresso per la rete oppure è connesso solamente a un terminale di uscita di un elemento della rete;
- la rete non contiene percorsi ciclici: ogni percorso che la attraversa passa attraverso ogni nodo al massimo una volta.

La **specifica funzionale** di una rete combinatoria è solitamente espressa come una **tabella di verità** o come **un’espressione booleana**.

## Espressioni booleane

Le espressioni booleane si basano su vaiabili che possono assumere solo i valori **vero (1)** o **falso (0)**.

### Teminologia

- complemento = NOT;
- letterale = variabile;
- prodotto logico = AND;
- mintermine = prodotto di tutti gli ingressi di una funzione;
- somma logica = OR;
- maxtermine = somma di tutti gli ingressi di una funzione.

### Precedenza operatori

- NOT;
- AND;
- OR.

### Somma di prodotti

Ogni **riga** di una **tabella di verità** corrisponde ad un **mintermine**. **Sommando** tutti i **mintermini** il cui risultato è **vero** (o falso per poi negare l'espressione) si ottiene **l'espressione booleana** corrispondente alla tabella di verità. Essa è chiamata **forma canonica somma di prodotti**.

### Prodotto di somme

La **forma canonica prodotto di somme** consiste nel trattare ogni **riga** come un **maxtermine** e poi fare il **prodotto** di tutti i **maxtermini falsi**.

### Postulati

| Postulato                                                                                             | Forma duale                                                                                           | Nome            |
| ----------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- | --------------- |
| $B\neq 1\Rightarrow B=0$                                                                              | $B= 1\Rightarrow B\neq 0$                                                                             | Algebra binaria |
| $B\cdot 1=B$                                                                                          | $B+0=B$                                                                                               | Identità        |
| $B\cdot 0=0$                                                                                          | $B+1=1$                                                                                               | Nullo           |
| $B\cdot B=B$                                                                                          | $B+B=B$                                                                                               | Idempotenza     |
| $\overline{\overline{B}}$                                                                             |                                                                                                       | Involuzione     |
| $B\cdot\overline{B}=0$                                                                                | $B+\overline B=1$                                                                                     | Complemento     |
| $B\cdot C=C\cdot B$                                                                                   | $B\cdot C=C\cdot B$                                                                                   | Commutatività   |
| $(B\cdot C)\cdot D=B\cdot(C\cdot D)$                                                                  | $(B+C)+D=B+(C+D)$                                                                                     | Associatività   |
| $(B\cdot C)+(B\cdot D)=B\cdot(C+D)$                                                                   | $(B+C)\cdot(B+D)=B+(C\cdot D)$                                                                        | Distributività  |
| $B \cdot (B + C) = B$                                                                                 | $B + (B \cdot C) = B$                                                                                 | Assorbimento    |
| $(B \cdot C) + (B \cdot \overline{C}) = B$                                                            | $(B + C) \cdot (B + \overline{C}) = B$                                                                | Combinazione    |
| $(B \cdot C) + (\overline{B} \cdot D) + (C \cdot D) = B \cdot C + \overline{B} \cdot D$               | $(B + C) \cdot (\overline{B} + D) \cdot (C + D) = (B + C) \cdot (\overline{B} + D)$                   | Consenso        |
| $\overline{B_0 \cdot B_1 \cdot B_2 \dots} = (\overline{B_0} + \overline{B_1} + \overline{B_2} \dots)$ | $\overline{B_0 + B_1 + B_2 \dots} = (\overline{B_0} \cdot \overline{B_1} \cdot \overline{B_2} \dots)$ | De Morgan       |

Si defi­nisce un’espressione in somma di prodotti come **minima** se utilizza il minor numero possibile di implicanti. Se si confrontano espressioni con lo stesso numeri di implicanti, l’espressione minima è quella che usa il minor numero
possibile di letterali.

Un implicante è detto **implicante primo** se non può essere combinato con nessun altro elemento all’interno dell’espressione per formare un nuovo implicante con un numero minore di letterali.

In un’espressione minima, gli implicanti devono essere tutti implicanti primi, altrimenti è possibile combi­narli ulteriormente per diminuire il numero di letterali.

## Linee guida schema

- Gli ingressi vengono indicati a sinistra (o in alto) dello schema.
- Le uscite vengono indicate a destra (o in basso) dello schema.
- Le porte logiche, quando possibile, sono disegnate in modo che i segnali vadano da sinistra a destra.
- I fili dritti sono preferibili ai fili con troppi angoli.
- Fili che arrivano a una giunzione a T sono collegati tra loro.
- Un punto disegnato dove due fili si incrociano indica che quei fili sono col­legati tra loro.

Una qualsiasi espressione booleana in forma **somma di prodotti** può es­sere tradotta in schema circuitale in maniera sistematica. Uno schema circuitale così disegnato è chiamato **matrice logica programmabile (PLA)**.

Non sempre conviene usare la logica a due livelli perchè potrebbe aumentare di molto il numero delle porte utilizzate rispetto ad un altro approccio.

Quando si lavora con porte negate per facilitare la schematizzazione si spingono le bolle (NOT).

## Le mappe di karnaugh

Le **mappe di Karnaugh (K-map)** sono un metodo grafico di semplificazione di espressioni booleane, inventato nel **1953** da **Maurice Karnaugh**, ingegnere delle telecomunicazioni presso i **Bell Labs**.
Esse funzionano su problemi con al **massimo 4 variabili**.

### Funzionamento

La riga in alto nella mappa di Karnaugh mostra
le quattro possibili combinazioni di valori delle prime due variabili, mentre la prima colonna delle altre due.

L'ordine utilizzato per le combinazioni è il **codice Gray (00,01,11,10)**. Esso viene usato per far si che ogni riquadro differisca di una sola variabile da quelli adiacenti.

Nei riquadri si inseriscono i valori delle combinazioni ottenute dall'unione di righe e colonne.

Successivamente bisogna cerchiare gli 1 con le seguenti regole:

- Utilizzare il minor numero possibile di cerchi per includere tutti gli 1;
- Tutti i riquadri racchiusi in ciascun cerchio devono contenere 1;
- Ogni cerchio deve includere un numero di riquadri che sia una potenza di due (cioè 1, 2 o 4 riquadri) in qualsiasi direzione;
- Ogni cerchio deve essere il più largo possibile;
- È possibile disegnare un cerchio che avvolga le estremità della mappa di Karnaugh;
- Un 1 in una mappa di Karnaugh può essere cerchiato più di una volta, se questa operazione permette di utilizzare un numero minore di cerchi.

Il risultato si ottiene guardando i cerchi e facendo la somma di prodotti non più sulla singola combinazione ma sui cerchi, eliminando le variabili che cambiano all'interno dello stesso cerchio.

### Indifferenze

è possibile raggruppare più righe della tabella di verità mettendo un trattino al posto delle variabili il cui valore è indifferente per il risultato.

## Blocchi costitutivi combinatori

### Multiplexer

Il Multiplexer è un circuito che presi due ingressi, tramite un terzo ingresso, sceglie quali dei due ingressi mandare in uscita.

| S   | $D_1$ | $D_0$ | Y   |
| --- | ----- | ----- | --- |
| 0   | -     | 0     | 0   |
| 0   | -     | 1     | 1   |
| 1   | 0     | -     | 0   |
| 1   | 1     | -     | 1   |

$\overline{S}\cdot D_0+S\cdot D_1$

![](/src/multiplexer.drawio.svg)

Si possono costruire anche multiplexer più grandi a partire da quello a due ingressi visto precedentemente.

### Decoder

Un decoder ha N ingressi e $2^N$ uscite e attiva una delle sue uscite a seconda della combinazione di valori in ingresso.

| A   | B   | Y_0 | Y_1 | Y_2 | Y_3 |
| --- | --- | --- | --- | --- | --- |
| 0   | 0   | 1   | 0   | 0   | 0   |
| 0   | 1   | 0   | 1   | 0   | 0   |
| 1   | 0   | 0   | 0   | 1   | 0   |
| 1   | 1   | 0   | 0   | 0   | 1   |

![](/src/decoder.drawio.svg)

## Temporizzazione

Uno dei problemi più importanti legato alle reti è la **temporizzazione (timing)**: in altre parole, come fare in modo che la rete funzioni velocemente.

La logica combinatoria è caratterizzata da.

- ritardo di propagazione ($t_{pd}$): è il tempo massimo che trascorre dal momento in cui avviene un cambiamento nell’ingresso al momento in cui l’uscita raggiunge il suo valore finale.
- ritardo di contaminazione ($t_{cd}$): è il tempo minimo che trascorre dal momento in cui cambia un ingresso al momento in cui una qualsiasi uscita comincia il processo di adattamento del suo valore.

![](/src/tempo.png)

### Alee

Le alee sono delle transizioni temporanee indesiderate che possono verificarsi nelle uscite del circuito in risposta a una singola variazione di ingresso. Si verificano quando il segnale di uscita cambia più volte prima di stabilizzarsi al valore corretto. Questi fenomeni sono causati da ritardi di propagazione differenti lungo i vari percorsi logici interni al circuito.

Per evitare le alee è possibile aggiungere una parte superflua alla rete, individuabile tramite la mappa di karnaugh.

# Reti logiche sequenziali

La logica sequenziale può ricordare esplicitamente alcuni ingressi precedenti, riassumendoli in **stati**.

Lo **stato** di una rete digitale sequenziale è un insieme di bit, detto **variabili di stato**, che contiene tutte le informazioni sul passato necessarie a spiegare il comportamento futuro della rete.

## Latch e flip-flop

Il blocco costitutivo fondamentale di memoria è un elemento bistabile, cioè un elemento con due stati stabili.

### Latch SR

Il latch ha due ingressi, $S$ e $R$, e due uscite, $Q$ e $\overline{Q}$.

| S   | R   | $Q_{next}$ | $\overline{Q_{next}}$ |
| --- | --- | ---------- | --------------------- |
| 0   | 0   | $Q$        | $\overline{Q}$        |
| 0   | 1   | 0          | 1                     |
| 1   | 0   | 1          | 0                     |
| 1   | 1   | 0          | 0                     |

![](/src/latch_sr.drawio.svg)

### Latch D

Il **latch SR** è scomodo in quanto si comporta in maniera imprevedibile quando entrambi gli ingressi, **S** e **R**, sono attivati simultaneamente, inoltre, questi ingressi controllano sia il **modo** in cui lo stato cambia che il **momento** in cui avviene il cambiamento. La progettazione delle reti diventa più semplice se questi due aspetti, il "**modo**" e il "**momento**", vengono trattati separatamente. Il **latch D** è una soluzione a questi problemi.

Questo latch ha due ingressi: un ingresso **dati**, **D**, che controlla il prossimo stato, e un ingresso **clock**, **CLK**, che controlla invece il momento del cambio di stato.

| CLK | $D$ | $\overline{D}$ | $S$ | $R$ | $Q$        | $\overline{Q}$        |
| --- | --- | -------------- | --- | --- | ---------- | --------------------- |
| 0   | $X$ | $\overline{X}$ | 0   | 0   | $Q_{prec}$ | $\overline{Q_{prec}}$ |
| 1   | 0   | 1              | 0   | 1   | 0          | 1                     |
| 1   | 1   | 0              | 1   | 0   | 1          | 0                     |

![](/src/latch_d.drawio.svg)

### Flip-flop D

Il **latch D** soffre del problema della **trasparenza**, poiché l'uscita segue l'ingresso quando il clock è a 1, rendendo **instabile** il sistema se l'ingresso cambia durante questo stato. Al contrario, il **flip-flop D** risolve questo problema aggiornando l'uscita solo al fronte di salita del clock (quando passa da 0 a 1), evitando che l'uscita cambi continuamente e garantendo un comportamento **stabile** e **sincrono**.

Tuttavia, il f**lip-flop D** è tipicamente realizzato con una **coppia di latch** (uno controllato dal clock e uno dal suo complemento), il che introduce una **latenza iniziale**: per ottenere il primo aggiornamento completo, sono necessari **due cicli di clock**.

![](/src/flip-flop_d.drawio.svg)

### Registro

Un registro a **N** bit è un banco di **N flip-flop** che condividono un ingresso **CLK comune**, in modo che tutti i bit vengano aggiornati allo stesso tempo. I registri costituiscono i blocchi costitutivi chiave per la maggior parte delle **reti sequenziali**.

### Flip-flop con abilitazione

Un **flip-flop** con abilitazione aggiunge un altro ingresso, chiamato **EN** o **ENABLE**, per determinare se **memorizzare** o no il dato sul **fronte del clock**.

![](/src/flip-flop_en.drawio.svg)

## Reti sequenziali sincrone

Le **reti sequenziali** contengono **percorsi ciclici** in cui le uscite sono collegate retroattivamente agli ingressi. Queste reti possono avere **condizioni di corsa** e comportamenti instabili, rendendo l'analisi complessa. Per evitarli, si introducono **registri**, trasformando la rete in una combinazione di logica combinatoria e registri. I registri contengono lo stato del sistema, che cambia solo al fronte di clock.

Una **rete sequenziale sincrona** ha:

- Un ingresso di clock.
- Stati discreti $\{S_0, S_1, \ldots, S_{k-1}\}$.
- Specifica funzionale per definire lo stato prossimo $S'$ e le uscite in base a $S$ e ingressi.
- Specifica temporale con limiti $t_{pcq}$ e $t_{ccq}$, e tempi di **setup** $t_{setup}$ e **hold** $t_{hold}$.

Regole di composizione:

- Ogni elemento è un registro o una rete combinatoria.
- Deve esserci almeno un registro.
- Tutti i registri ricevono lo stesso segnale di clock.
- Ogni percorso ciclico contiene almeno un registro.

## Macchine a stati finiti

Le **reti sequenziali sincrone** possono essere rappresentate come **macchine a stati finiti** (FSM, finite state machine). Una rete con $k$ registri può trovarsi in uno dei $2^k$ stati diversi. Una FSM ha:

- $M$ ingressi,
- $N$ uscite,
- $k$ bit di stato,
- un segnale di clock e, talvolta, un segnale di reset.

Una FSM è composta da due blocchi di logica combinatoria:

1. **Logica di stato prossimo**,
2. **Logica d’uscita**.

Un registro immagazzina lo stato della FSM. Ad ogni fronte di salita del clock, la FSM avanza allo stato prossimo, determinato dagli ingressi e dallo stato presente.

Esistono due classi di macchine a stati finiti:

- **Macchine di Moore**: le uscite dipendono solo dallo stato presente.
- **Macchine di Mealy**: le uscite dipendono sia dallo stato presente sia dagli ingressi attuali.

Le macchine a stati finiti forniscono un metodo sistematico per progettare reti sequenziali sincrone, partendo dalla specifica funzionale.

Per rappresentare una macchina a stati finiti si usano i seguenti simboli:

- **Cerchi:** rappresentano gli stati;
- **Archi:** rappresentano le transizioni, avvenendo al fronte di salita del clock;
- L'arco **Reset:** indica che il sistema passa allo stato $S_0$ in caso di reset, indipendentemente dallo stato precedente;
- Transizioni con più archi sono etichettate per mostrare quale ingresso causa la transizione.

Nel diagramma degli stati per le macchine di Moore i valori delle uscite vengono indicati nei cerchi, mentre, nelle macchine di Mealy le uscite sono indicate negli archi.

## Temporizzazione nella logica sequenziale

Il **tempo di apertura** di un elemento sequenziale è definito dal tempo di **setup** e dal tempo di **hold**, rispettivamente prima e dopo il fronte del clock. Nella disciplina dinamica, il tempo è composto da unità discrete chiamate **cicli di clock**, e il segnale assume un valore finale stabilito al termine del ciclo. Si usa la notazione $A[n]$ per indicare il valore del segnale $A$ alla fine dell’n-esimo ciclo di clock.

Il **periodo del clock** deve essere sufficientemente lungo per consentire a tutti i segnali di stabilizzarsi, il che limita la velocità del sistema. Inoltre, il **sfasamento del clock** tra i flip-flop aumenta il periodo necessario.

In alcuni casi, come quando si interagisce con ingressi esterni (es. un pulsante), si può verificare la **metastabilità**: un flip-flop campiona un valore incerto tra 0 e 1, richiedendo un tempo indefinito per tornare a un valore logico stabile. Per gestire ingressi asincroni, si può utilizzare un **sincronizzatore**, anche se questo può produrre valori logicamente scorretti, seppur con bassa probabilità.

La **disciplina dinamica** stabilisce che gli ingressi di una rete sequenziale sincrona devono rimanere stabili durante il **tempo di apertura** (setup + hold) prima e dopo il fronte del clock. Questo assicura che i segnali vengano campionati dal flip-flop quando sono stabili. Pertanto, i segnali possono essere considerati come discreti sia nel tempo che nei livelli logici.

Il **periodo di clock** ($T_c$) è il tempo tra i fronti di salita del segnale di clock, e la sua frequenza ($f_c = \frac{1}{T_c}$) è misurata in Hertz (Hz). Aumentare la frequenza di clock aumenta la quantità di lavoro svolta da un sistema digitale per unità di tempo.

Quando si calcola il periodo di clock in una rete sequenziale sincrona, il registro $R_1$ produce un'uscita ($Q_1$) al fronte di salita del clock, che entra in un blocco di logica combinatoria per generare $D_2$, l'ingresso per il registro $R_2$. I segnali d'uscita cambiano dopo un **ritardo di contaminazione** e si stabilizzano dopo un **ritardo di propagazione**. Questi ritardi sono cruciali per analizzare i vincoli temporali relativi ai tempi di setup e hold del registro $R_2$.

![](/src/ritardi.png)

Il **tempo di ciclo** ($T_c$) deve rispettare la condizione:

$$
T_c \geq t_{pcq} + t_{pd} + t_{setup}
$$

dove $t_{pcq}$ è il ritardo di propagazione da clock a Q e $t_{setup}$ è il tempo di setup del flip-flop. Il ritardo massimo di propagazione attraverso la logica combinatoria può essere calcolato come:

$$
t_{pd} \leq T_c - (t_{pcq} + t_{setup})
$$

Il termine $t_{pcq} + t_{setup}$ è il **sovraccarico di sequenziamento**, che limita il tempo disponibile per la logica combinatoria.

Per quanto riguarda il **tempo di hold**, l'ingresso $D_2$ di $R_2$ non deve cambiare per un certo periodo di tempo ($t_{hold}$) dopo il fronte di clock, esprimibile come:

$$
t_{ccq} + t_{cd} \geq t_{hold}
$$

Da cui si ricava il ritardo minimo di contaminazione:

$$
t_{cd} \geq t_{hold} - t_{ccq}
$$

Idealmente, per flip-flop affidabili, $t_{hold}$ dovrebbe essere minore del ritardo di contaminazione:

$$
t_{hold} \geq t_{ccq} \quad
$$

I vincoli sul tempo di hold sono cruciali; se non vengono rispettati, è necessaria una riprogettazione della rete, poiché non possono essere risolti aumentando il periodo del clock.

## Sincronizzatori

Per garantire dei livelli logici corretti, tutti gli ingressi asincroni dovrebbero essere fatti passare attraverso dei sincronizzatori.

Un sincronizzatore riceve un ingresso asincrono $D$ e un clock $CLK$, producendo un’uscita $Q$. Se $D$ è stabile durante il tempo di apertura, $Q$ riflette il valore di $D$. Se $D$ cambia durante il tempo di apertura, $Q$ può essere ALTO o BASSO, ma non meta-stabile.

Un sincronizzatore può essere realizzato con due flip-flop.

![](/src/sincronizzatore.drawio.svg)

Un sincronizzatore fallisce se $Q$ diventa metastabile, ciò può accadere se l'uscita intermedia $D_2$ non si stabilizza prima di essere campionata. La probabilità di errore per un cambiamento di un ingresso è data da:

$$P(errore) = \frac{T_{0}}{T_{c}}e^{-\frac{T_{c}-T_{setup}}{\tau}}$$

La **probabilità di errore**, $P(\text{errore})$, è la probabilità che l'uscita $Q$ diventi metastabile a causa di un cambiamento in $D$. Se $D$ cambia $N$ volte al secondo, la probabilità di errore diventa:

$$P(errore)/sec = N_0 \frac{T}{T_c} e^{-\frac{T_c - T_{setup}}{\tau}}$$

L'**affidabilità** di un sistema si misura con il **tempo medio tra errori** (MTBF). Il **MTBF** è il reciproco della probabilità che il sistema generi un errore in un istante dato:

$MTBF = \frac{1}{P(errore)/sec} = \frac{T_c}{NT_0} e^{-\frac{T_c - T_{setup}}{\tau}}$

Il **MTBF** aumenta esponenzialmente con il tempo di attesa $T_c$. Nei sistemi veloci, possono servire più cicli di clock.

## Parallelismo

La **velocità** di un sistema è data da **latenza** e **throughput**. La latenza è il tempo impiegato da un token (un gruppo di dati) per attraversare il sistema, mentre il throughput indica quanti token possono essere elaborati per unità di tempo.

Il **throughput** aumenta elaborando più token simultaneamente, attraverso il **parallelismo**, che può essere di due tipi: **spaziale**, che utilizza più copie dell'hardware per eseguire più lavori contemporaneamente, o **temporale** (**pipelining**), divide i compiti in fasi, permettendo l'esecuzione sovrapposta di più compiti.

La **capacità produttiva** di un sistema senza parallelismo è $1/L$, dove $L$ è la latenza. Con **parallelismo spaziale** e $N$ copie dell'hardware, diventa $N/L$. Nel **parallelismo temporale** (pipelining), il compito viene diviso in $N$ fasi, mantenendo una capacità di $N/L$ con un'unica copia dell'hardware. Tuttavia, se le fasi hanno durate diverse, la capacità produttiva è $1/L_1$, dove $L_1$ è la latenza della fase più lunga.

Il parallelismo temporale migliora la capacità produttiva dividendo la logica in stadi più semplici. L'inserimento di registri tra blocchi di logica consente un clock più veloce, aumentando il throughput ma con un leggero aumento della latenza. Il parallelismo è limitato dalle dipendenze tra operazioni, che possono impedire l'esecuzione simultanea di più compiti.

#
