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

---

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

![](./img/multiplexer.drawio.svg)

Si possono costruire anche multiplexer più grandi a partire da quello a due ingressi visto precedentemente.

### Decoder

Un decoder ha N ingressi e $2^N$ uscite e attiva una delle sue uscite a seconda della combinazione di valori in ingresso.

| A   | B   | $Y_0$ | $Y_1$ | $Y_2$ | $Y_3$ |
| --- | --- | ----- | ----- | ----- | ----- |
| 0   | 0   | 1     | 0     | 0     | 0     |
| 0   | 1   | 0     | 1     | 0     | 0     |
| 1   | 0   | 0     | 0     | 1     | 0     |
| 1   | 1   | 0     | 0     | 0     | 1     |

![](./img/decoder.drawio.svg)

## Temporizzazione

Uno dei problemi più importanti legato alle reti è la **temporizzazione (timing)**: in altre parole, come fare in modo che la rete funzioni velocemente.

La logica combinatoria è caratterizzata da.

- ritardo di propagazione ($t_{pd}$): è il tempo massimo che trascorre dal momento in cui avviene un cambiamento nell’ingresso al momento in cui l’uscita raggiunge il suo valore finale.
- ritardo di contaminazione ($t_{cd}$): è il tempo minimo che trascorre dal momento in cui cambia un ingresso al momento in cui una qualsiasi uscita comincia il processo di adattamento del suo valore.

![](./img/tempo.png)

### Alee

Le alee sono delle transizioni temporanee indesiderate che possono verificarsi nelle uscite del circuito in risposta a una singola variazione di ingresso. Si verificano quando il segnale di uscita cambia più volte prima di stabilizzarsi al valore corretto. Questi fenomeni sono causati da ritardi di propagazione differenti lungo i vari percorsi logici interni al circuito.

Per evitare le alee è possibile aggiungere una parte superflua alla rete, individuabile tramite la mappa di karnaugh.
