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
    - [Porta XOR](#porta-xor)
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
- [Blocchi costruttivi digitali](#blocchi-costruttivi-digitali)
  - [Circuiti aritmetici](#circuiti-aritmetici)
    - [Half adder](#half-adder)
    - [Full adder](#full-adder)
    - [Sommatore a propagazione di riporto a onda](#sommatore-a-propagazione-di-riporto-a-onda)
    - [Sommatore ad anticipazione di riporto](#sommatore-ad-anticipazione-di-riporto)
    - [Sommatore a prefissi](#sommatore-a-prefissi)
    - [Sottrazione](#sottrazione)
    - [Comparatore](#comparatore)
      - [Comparatore di uguaglianza](#comparatore-di-uguaglianza)
      - [Comparatore di valore](#comparatore-di-valore)
    - [ALU](#alu)
    - [Translatori e rotatori](#translatori-e-rotatori)
  - [Componenti di memoria](#componenti-di-memoria)
    - [Celle di bit](#celle-di-bit)
    - [Porte di memoria](#porte-di-memoria)
    - [Tipi di memoria](#tipi-di-memoria)
    - [DRAM](#dram)
    - [SRAM](#sram)
    - [Banchi di registri](#banchi-di-registri)
    - [ROM](#rom)
- [Assembler](#assembler)
  - [Costanti](#costanti)
  - [Registri](#registri)
  - [Memoria](#memoria)
  - [Istruzioni](#istruzioni)
    - [Shift](#shift)
  - [Flag](#flag)
    - [Mnemonici di condizione](#mnemonici-di-condizione)
    - [Mnemonici più utili per CMP](#mnemonici-più-utili-per-cmp)
  - [Salti](#salti)
  - [Costrutti](#costrutti)
- [cicli](#cicli)
  - [Memoria](#memoria-1)

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

### Porta XOR

La porta **XOR** può essere costruita con le **AND** e le **OR** nel seguente modo:

$$A\oplus B = \overline{A}\cdot B+A\cdot\overline{B}$$

![](/src/xor.drawio.svg)

```verilog
module XOR(output c, input a, input b);
    assign
        c = (!a && b) || (a && !b);
endmodule
```

In verilog la xor si può fare direttamente con il simbolo ^.

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

| A   | B   | $Y_0$ | $Y_1$ | $Y_2$ | $Y_3$ |
| --- | --- | ----- | ----- | ----- | ----- |
| 0   | 0   | 1     | 0     | 0     | 0     |
| 0   | 1   | 0     | 1     | 0     | 0     |
| 1   | 0   | 0     | 0     | 1     | 0     |
| 1   | 1   | 0     | 0     | 0     | 1     |

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

# Blocchi costruttivi digitali

I blocchi combinatori e sequenziali descritti di seguito sono progettati per **1 bit**. Grazie al principio di **modularità**, è possibile combinare $N$ blocchi da 1 bit per creare circuiti che operano su $N$ bit. Questo approccio consente di estendere facilmente le funzionalità senza dover riprogettare l'intero circuito.

## Circuiti aritmetici

I circuiti aritmetici sono i blocchi costruttivi centrali dei calcolatori.

### Half adder

L'half adder è un circuito che prende due bit ($A$ e $B$) in ingresso e restituisce la ($S$) ed il **riporto** o **carry** ($C$)

| $A$ | $B$ | $S$ | $C$ |
| --- | --- | --- | --- |
| 0   | 0   | 0   | 0   |
| 0   | 1   | 1   | 0   |
| 1   | 0   | 1   | 0   |
| 1   | 1   | 0   | 1   |

$$S=A\oplus B$$
$$C=A\cdot B$$

![](/src/half_adder.drawio.svg)

```verilog
module HA(output rip, output c, input a, input b);
    assign
        rip = a && b;

    assign
        c = a ^ b;
endmodule
```

### Full adder

Per fare un sommatore che sia modulare dobbiamo aggiungere il riporto in ingresso ($c_{in}$). Ciò si può fare usando due half-adder.

Il primo half adder prende in ingresso $A$ e $B$ restituendo $S_0$ e $C_0$.

Il secondo prende in ingresso $S_0$ $C_{in}$ restituendo $S_1$ (il risultato) e $C_1$.

Il riporto viene calcolato come:

$$C_{out}=S_0+S_1$$

![](/src/full-adder.drawio.svg)

```verilog
module FA(output cout, output s, input a, input b, input cin);
    wire s0, c0, c1;
    HA ha1(c0,s0,a,b);
    HA ha2(c1,s,s0,cin);
    assign
      cout = c0 || c1;
endmodule
```

Unendo $N$ full adder a 1 bit, otteniamo un sommatore completo a $N$ bit. Esistono più tipi di sommatore che possono essere realizzati unendo i full adder in modi diversi.

### Sommatore a propagazione di riporto a onda

Il metodo più semplice per costruire un **sommatore a propagazione di riporto a onda** a $N$ bit è collegare in cascata $N$ full adder completi.
In questo modo, $R_{out}$ di uno stadio costituisce $R_{in}$ per lo stadio successivo.
Il principale svantaggio legato a questo sommatore è il progressivo rallentamento all’aumentare di $N$, poiché ogni stadio deve aspettare che termini lo stadio precedente per poter iniziare.

Il ritardo di propagazione nel sommatore, $t_{propag}$, aumenta all’aumentare del numero di bit coinvolti.
$$t_{propag} = N\cdot t_{FA}$$

### Sommatore ad anticipazione di riporto

Un sommatore ad anticipazione di riporto risolve il problema della velocità dividendo il sommatore stesso in blocchi e aggiungendo un circuito per determinare velocemente il riporto di uscita da ciascun blocco appena è noto il riporto di ingresso.

La colonna i di un sommatore genera sicuramente $R_i$ se $A_i$ e $B_i$ sono entrambi uguali a 1. Si dice che la colonna $i$ **propaga** un riporto se produce un riporto di uscita ogniqualvolta ci sia un riporto di ingresso. La colonna i propaga il proprio riporto di ingresso, $R_{i−1}$, se o $A_i$ o $B_i$ sono uguali a 1.

$$R_j = A_j B_j + (A_j + B_j) R_{j-1} = G_j + P_j R_{j-1}$$

Le definizioni di **generazione** e **propagazione** si estendono ai blocchi formati da **più bit**.
$G_{i:j}$ e $P_{i:j}$ vengono definiti, rispettivamente, come segnali di generazione e di propagazione per $i$ blocchi che vanno dalla colonna $i$ alla colonna $j$.

$$R_i = G_{i:j} + P_{i:j} R_{j-1}$$

Quindi, un sommatore a $N$ bit diviso in blocchi da $k$ bit ha un ritardo pari a:

$$t_{CLA} = t_{pg} + t_{pg\_blocco} + \left(\frac{N}{k} - 1\right) t_{AND\_OR} + kt_{FA}$$

### Sommatore a prefissi

Il sommatore a prefissi estende la logica di generazione e di propagazione del sommatore ad anticipazione di riporto per eseguire l’addizione ancora più rapidamente.

In altre parole, la strategia di un sommatore a prefissi è di calcolare il più rapidamente possibile il segnale di ingresso $R_{i−1}$ per ogni colonna i per poi eseguire la somma, utilizzando l’espressione:

$$S_i = (A_i \oplus B_i) \oplus R_{i-1}$$

Dati $G_{−1} = R_{in}$ e $P_{−1} = 0$ la formula diventa:

$$S_i = (A_i \oplus B_i) \oplus G_{i-1:-1}$$

Qundi per il blocco:

$$
G_{i,j} = G_{i,k} + P_{i,k} G_{k-1,j} \\
P_{i,j} = P_{i,k} + P_{i,k} P_{k-1,j}
$$

### Sottrazione

è uguale all'addizione basta fare il complemento a 2 del secondo numero.

### Comparatore

Un comparatore determina se due numeri binari sono uguali o se uno dei due è maggiore o minore dell’altro.

#### Comparatore di uguaglianza

Ha un solo bit di uscita che indica se i numeri a N-bit passati sono uguali.

![](/src/comparatore.drawio.svg)

#### Comparatore di valore

Un comparatore di valore produce invece una o più uscite che indicano i valori relativi di $A$ e di $B$.

La comparazione con segno viene fatta tramite la **sottrazione**. Questo tipo di comparazione non funziona bene con l'**overflow**.

### ALU

Un’**unità logica/aritmetica (ALU, Arithmetic/Logical Unit)** unisce all’interno di una singola unità una serie di operazioni logiche e matematiche.

Una ALU tipica è in grado di eseguire le operazioni di addizione, sottrazione, AND e OR logici bit a bit. L’ALU è il cuore della maggior parte dei calcolatori.

La ALU riceve un segnale di controllo a 2 bit, chiamato **Controllo-ALU**, che specifica quale funzione debba eseguire.

Inoltre, contiene dei negatori e un multiplexer per invertire l’ingresso $B$ quando il segnale di controllo $\text{ControlloALU}_0$ è attivato.

Alcune ALU producono uscite ulteriori, chiamate **flag** (bandiere), che danno informazioni aggiuntive sul risultato dell’ALU. l’uscita FlagALU è composta dalle flag:

- $N$: il risultato dell’ALU è **negativo** ed è connessa al bit più significativo del risultato dell'ALU;
- $Z$: il risultato dell’ALU è **uguale a 0**;
- $C$: il sommatore ha generato un **carry**;
- $V$ il sommatore ha generato un **overflow**.

![](/src/ALU.png)

### Translatori e rotatori

- **Traslatore logico**: trasla un numero verso sinistra (LSL, Logical Shift Left) o verso destra (LSR, Logical Shift Right) e riempie gli spazi lasciati vuoti con 0.
- **Traslatore aritmetico**: esegue la stessa funzione di un traslatore logico, ma quando trasla un numero verso destra (ARS, Arithmetic Shift Right), riempie i bit più significativi con una copia del precedente bit più significativo (msb, most significant bit). Utile per i numeri con segno.
- **Rotatore**: trasla un numero verso sinistra (ROL, Rotate Left) o verso destra (ROR, Rotate Right) circolarmente, in modo che gli spazi lasciati vuoti vengano riempiti dai bit all’estremità opposta del numero.

Un traslatore a $N$ bit può essere costruito con un numero $N$ di multiplexer $N:1$.

![](/src/traslatori_rotatori.png)

## Componenti di memoria

Ci sono tre tipi di memoria principale:

- la memoria ad accesso casuale dinamica (DRAM, Dynamic Random Access Memory);
- la memoria ad accesso casuale statica (SRAM, Static Random Access Memory);
- la memoria a sola lettura (ROM, Read Only Memory).

Un componente è formato da: un numero $N$ di bit di indirizzo e un numero $M$ di bit di dato. Esso possiede $2^N$ righe e $M$ colonne.

La **lunghezza** di un componente di memoria indica il numero di **righe** che possiede, mentre la sua **larghezza** fa riferimento al numero di **colonne** e quindi alla dimensione di parola. La **dimensione totale** del componente è uguale al prodotto **lunghezza × larghezza**.

### Celle di bit

I componenti di memoria vengono realizzati come matrici di celle di bit, ognuna delle quali può contenere un bit di dato.

Quando una linea di parola è attiva, consente la lettura o la scrittura dei bit sulla riga corrispondente. Altrimenti, la cella è disconnessa.

Per leggere un bit, la linea di bit viene lasciata fluttuante ($Z$) e poi attivata la linea di parola, che imposta la linea di bit a 0 o 1 in base al valore memorizzato. Per scrivere, la linea di bit viene forzata al valore desiderato e la linea di parola viene attivata per memorizzarlo, sovrascrivendo il contenuto precedente.

### Porte di memoria

Tutte le memorie possiedono una o più porte. Ognuna di queste fornisce un accesso in lettura e/o in scrittura a un indirizzo di memoria. Le memorie **multi-porta** possono accedere a più indirizzi nello stesso momento.

### Tipi di memoria

Le memorie sono classificate in base a come immagazzinano i bit nelle celle di memoria. Si distinguono principalmente in:

- **Memorie ad accesso casuale (RAM)**: memorie **volatili** che perdono i dati quando l'alimentazione viene spenta.
- **Memorie a sola lettura (ROM)**: memorie **non volatili** che mantengono i dati anche senza alimentazione.

I due principali tipi di RAM sono la **RAM dinamica (DRAM)** e la **RAM statica (SRAM)**:

- **DRAM** immagazzina i dati come carica su un condensatore.
- **SRAM** utilizza una coppia di negatori incrociati per memorizzare i dati.

Esistono diversi tipi di **memorie ROM**, che si distinguono per il modo in cui vengono scritte e cancellate.

### DRAM

La **RAM dinamica (DRAM)** memorizza un bit tramite la presenza o assenza di carica in un condensatore. Un transistore nMOS agisce come un interruttore che collega il condensatore alla linea di bit quando la linea di parola è attiva. Se il condensatore è caricato a **VDD**, il bit memorizzato è **1**; se è scaricato a **GND**, il bit è **0**. La lettura del bit trasferisce il valore dal condensatore alla linea di bit, distruggendo il dato, che deve essere riscritto. Poiché la carica del condensatore si dissipa nel tempo, è necessario rinfrescare periodicamente la DRAM.

![](/src/DRAM.png)

### SRAM

La **RAM statica (SRAM)** si chiama così perché i bit immagazzinati non necessitano di ricarica periodica. Una cella di bit della SRAM utilizza dei negatori collegati a croce per mantenere il valore del dato. Ogni cella ha due uscite, **linea_di_bit** e **linea_di_bit complementare**. Quando la linea di parola è attiva, i transistori nMOS trasferiscono i dati tra la cella e le linee di bit. A differenza della DRAM, se il valore del bit viene deteriorato dal rumore, i negatori collegati a croce ripristinano il valore corretto.

![](/src/SRAM.png)

### Banchi di registri

I sistemi digitali utilizzano spesso un gruppo di registri, chiamato **banco di registri** (register file), per memorizzare variabili temporanee. Questo banco di registri è solitamente realizzato come una piccola **SRAM multi-porta**, poiché è più compatta rispetto a una matrice di flip-flop. Un banco di registri può avere più porte di lettura e scrittura, permettendo di leggere contemporaneamente da più registri e di scriverne su un altro nello stesso momento.

### ROM

La **memoria a sola lettura (ROM)** memorizza un bit attraverso la presenza o assenza di un transistor. Quando la linea di parola viene attivata, il transistor forza la linea di bit a un valore basso (0) se è presente, altrimenti la linea rimane alta (1). Essendo una memoria combinatoria, la ROM non perde il contenuto quando l'alimentazione viene interrotta. Esistono diversi tipi di ROM:

- **PROM (Programmable ROM)**: programmabile una sola volta. Utilizza fusibili che vengono bruciati per disconnettere i transistor.
- **EPROM (Erasable PROM)**: utilizza un transistor a gate sommerso. Può essere cancellata esponendo la memoria a luce UV, permettendo la rimozione degli elettroni dal gate.
- **EEPROM (Electrically Erasable PROM)**: simile all'EPROM, ma la cancellazione avviene elettricamente senza l'uso di luce UV, e consente la cancellazione di bit individuali.
- **Memorie flash**: un tipo di EEPROM, che cancella blocchi più grandi di bit anziché singoli, risultando più economica e ampiamente utilizzata per immagazzinare grandi quantità di dati in dispositivi portatili.

# Assembler

I calcolatori comprendono istruzioni in codice binario (chiamato codice macchina) che sono tradotte 1:1 con il codice assembly.

Il codice macchina non dipende dalla [Microarchitettura](#astrazione-disciplina-e-le-tre-y).

I quattro principi definiti da **David Patterson** e **John Hennessy**:

- **Regolarità**: favorisce la semplicità;
- Rendere veloci le cose frequenti;
- Più piccolo è più veloce;
- Un buon progetto richiede buoni compromessi.

ARM è un calcolatore con architettura **RISC** (Reduced Instruction Set Computer).
Il set di istruzioni di ARM rende veloci le cose frequenti inserendo solo istruzioni semplici usate spesso.

## Costanti

Sono semplici **numeri** ed in **Assembly** si indicano mettendo il **'#'** seguito dal **numero** desiderato.

## Registri

Visto che l'accesso alla memoria è un'operazione lenta le **CPU** hanno dei loro registri.
L’architettura **ARM** usa **16 registri**, globalmente indicati come **register file**.
Meno sono i registri, più rapidamente sono accessibili.
Il **register file** è generalmente costituito da un piccolo **array** (vettore) di memoria **SRAM**.

In **Assembly** i nomi dei **registri** sono composti dalla lettera **R** seguita da un **numero** e i registri hanno degli utilizzi specifici indicati nella seguente tabella:

| Registri | Utilizzi                                            |
| -------- | --------------------------------------------------- |
| R0       | Parametro/valore da restituire/variabile temporanea |
| R1-R3    | Parametri/variabili temporanee                      |
| R4-R11   | Variabili salvate                                   |
| R12      | Variabile temporanea                                |
| R13 (SP) | Stack Pointer                                       |
| R14 (LR) | Link Register                                       |
| R15 (PC) | Program Counter                                     |

Per quanto riguarda le variabili temporanee, possiamo utilizzarle senza preoccuparci dei dati che c'erano prima.
Mentre, se utilizzialo le variabili salvate dobbiamo rimettere al loro interno i dati che c'erano prima dell'esecuzione del nostro programma prima di terminarlo.

(Si può fare facilmente salvandole nello stack per poi riprenderle prima della fine del programma.)

## Memoria

Ma i dati possono anche essere memorizzati nella **RAM**.
In **ARM** le **istruzioni** operano **solo sui registri**, quindi i dati presenti in memoria devono essere copiati nei registri prima di essere elaborati.

L’architettura **ARM** usa **32 bit** per gli **indirizzi** di memoria e 32 bit per le **parole** di dato e fa uso di memoria indirizzabile a byte (**byte addressable**), cioè ogni **byte** di memoria ha un **indirizzo univoco**.

Una **parola** di **32 bit** (**word**) è costituita da quattro byte da 8 bit ciascuno, quindi **ogni indirizzo di parola è un multiplo di 4**.

L’istruzione **LDR** specifica l’indirizzo di memoria usando un **registro base** e un **offset**.

L’indirizzo di memoria viene formato **sommando** il contenuto del **registro base** e l'**offset**.

ARM usa l’istruzione **STR** (**STore Register**) per scrivere una parola di dato da un **registro** in **memoria**.

Le memorie indirizzabili a byte sono organizzate in modalità **big-endian** oppure **little-endian**.
Nel primo si iniziano a salvare i dati in memoria dal bit **più significativo**, mentre nel secondo dal **meno significativo**.
**ARM** è **little-endian**.

## Istruzioni

Nella seguente tabella indico con # dove può andare anche un immediato (costante).

| Codice assembly ARM | Significato           |
| ------------------- | --------------------- |
| MOV                 | Move                  |
| MVN                 | Move and not          |
| ADD                 | Sum                   |
| SUB                 | Subtraction           |
| MUL                 | Moltiply              |
| UMUL                | Unsigned MUL (64 bit) |
| SMUL                | Signed MUL (64 bit)   |
| MLA                 | MUL Accumulate        |
| UMLAL               | UMUL Accumulate       |
| SMLAL               | SMUL Accumulate       |
| AND                 | And                   |
| ORR                 | Or                    |
| EOR                 | Xor                   |
| BIC                 | Byte clear (And not)  |

### Shift

| Codice assembly ARM | Significato            |
| ------------------- | ---------------------- |
| LSL                 | Logical shift left     |
| LSR                 | Logical shift right    |
| ASR                 | Arithmetic shift right |
| ROR                 | Rotate right           |

## Flag

Alcune operazioni possono impostare dei flag (bit a 0 o 1) che possiamo utilizzare per eseguire delle operazioni solo se il flag in questione è a 1 scrivendo il flag attaccato all'operazione da eseguire come fosse un unico comando. L'operazione più comune per impostare i flag è la compare (CMP),che confronta due valori e aggiorna i flag di conseguenza.

Di seguito sono riportati tutti i flag:

| Flag |   Nome : |
| ---- | -------: |
| N    | Negative |
| Z    |     Zero |
| C    |    Carry |
| V    | Overflow |

### Mnemonici di condizione

| **Cond** | **Mnemonico** | **Nome**                                                                           | **CondEse**                       |
| -------- | ------------- | ---------------------------------------------------------------------------------- | --------------------------------- |
| 0000     | EQ            | Uguale (_Equal_)                                                                   | Z                                 |
| 0001     | NE            | Diverso (_Not Equal_)                                                              | \( \overline{Z} \)                |
| 0010     | CS/HS         | Attiva riporto/maggiore o uguale senza segno (_Carry Set/unsigned Higher or Same_) | C                                 |
| 0011     | CC/LO         | Disattiva riporto/minore senza segno (_Carry Clear/unsigned Lower_)                | \( \overline{C} \)                |
| 0100     | MI            | Meno/negativo (_Minus/negative_)                                                   | N                                 |
| 0101     | PL            | Più/positivo o nullo (_Plus/positive or zero_)                                     | \( \overline{N} \)                |
| 0110     | VS            | Traboccamento/attiva traboccamento (_overflow/overflow Set_)                       | V                                 |
| 0111     | VC            | No traboccamento/disattiva traboccamento (_overflow/overflow Clear_)               | \( \overline{V} \)                |
| 1000     | HI            | Maggiore senza segno (_unsigned Higher_)                                           | \( Z \overline{C} \)              |
| 1001     | LS            | Minore o uguale senza segno (_unsigned Lower or Same_)                             | \( Z \ OR \ \overline{C} \)       |
| 1010     | GE            | Maggiore o uguale con segno (_signed Greater than or Equal_)                       | \( \overline{N} \oplus V \)       |
| 1011     | LT            | Minore con segno (_signed Less Than_)                                              | \( N \oplus V \)                  |
| 1100     | GT            | Maggiore con segno (_signed Greater Than_)                                         | \( \overline{Z} \ (N \oplus V) \) |
| 1101     | LE            | Minore o uguale con segno (_signed Less than or Equal_)                            | \( Z \ OR \ (N \oplus V) \)       |
| 1110     | AL (o niente) | Sempre/incondizionato (_ALways/unconditional_)                                     | Ignorato                          |

### Mnemonici più utili per CMP

| **Mnemonico** | **Nome**      |
| ------------- | ------------- |
| EQ            | Equal         |
| NE            | Not Equal     |
| GT            | Greater Than  |
| LT            | Lower Than    |
| GE            | Greater Equal |
| LE            | Lower Equal   |

## Salti

B (Branch) si usa per saltare ad una determinata etichetta del codice, mentre BL (Branch and link) si usa per chiamare funzioni esterne o per chiamate ricorsive.

## Costrutti

# cicli

```armasm
func:
  mov r0, #0
loop:
  cmp r0, r1
  beq end
  @ code
  add r0, r0, #1
  b loop
end:
  mov pc, lr
```

## Memoria

```armasm
LDR R3, [R0, R1, LSL #2]
@ Salva in R3 il contenuto del registro (r0 + (r1*4))
LDR R0, [R1, R2]!
@ Il ! serve ad indicare che r1 viene modificato
LDR R0, [R1], R2
@ Uguale alla forma di sopra solo che l'incremento viene eseguito dopo
LDRB @Carica un byte (si usa uguale alla LDR)
LDRSB @ Signed byte
STR R9, [R0, #8]
@ salva R9 nell' indirizzo di memoria contenuto in r0
PUSH {...} @ carica nello stack LIFO
POP {...} @ scarica dallo stack
```

Aggiungere il restante prima dell'orale
