Oltre al processore e alla memoria, un sistema di computer ha il bisogno di interfacciarsi con l'ambiente esterno,
questo viene fatto tramite le operazioni di **I/O**, che passano per dei **moduli di I/O**, attraverso il **BUS**,
arrivando ai dispositivi esterni detti **periferiche**.

![IO scheme](./img/io_scheme.png)

Le operazioni di **Input/Output (I/O)** hanno un impatto significativo sul tempo totale di esecuzione di un programma.

# Legge di Amdahl

La legge di Amdahl è stata proposta nel **1967** e descrive le massime potenzialità raggiungibili da un sistema quando
una sua porzione viene ottimizzata.

$$
Speedup=\frac{\text{Exec.time prima dell'ottimizzazione}}{\text{Exec.time dopo l'ottimizzazione}}
$$

Nel **calcolo parallelo**, la legge di Amdahl rappresenta uno dei limiti superiori di riferimento nel processo di
parallelizzazione.

Consideriamo un programma in cui solo una frazione $f$ può essere ottimizzata (ad esempio, parallelizzata con $n$
processori), mentre la frazione rimanente $(1 - f)$ rimane invariata perché intrinsecamente sequenziale.

Lo **speedup teorico** massimo ottenibile è dato da:

$$
Speedup=\frac{T(1-f)+T(f)}{T(1-f)+\frac{T(f)}{n}}=
\frac{T(1-f+f)}{T(1-f+\frac{f}{n})}=
\frac{1}{(1-f)+\frac{f}{n}}
$$

In questo esempio, il massimo speedup teorico raggiungibile è **10**. Tuttavia, questo valore è **irrealistico** nella
pratica.

Il motivo è che lo speedup è **limitato dalla frazione sequenziale** $(1 - f)$, ovvero dalla parte del sistema (o
programma) che non può essere migliorata o parallelizzata.

Per ottenere un **speedup significativo**, è fondamentale **minimizzare $(1 - f)$**, ovvero ridurre il più possibile la
parte del programma che rimane sequenziale. Questo concetto è cruciale nell'ottimizzazione dei sistemi paralleli e
multi-thread.

# Principi di I/O

Le performance sono molto importanti, ma contano anche aspetti come:

## Affidabilità

L'affidabilità di un sistema si misura attraverso metriche come:

-   **MTTF (Mean Time To Failure)** $\rightarrow$ Tempo medio di vita di un componente;
-   **MTBF (Mean Time Between Failure)** $\rightarrow$ Tempo medio che intercorre tra i guasti non irreparabili.
-   **Fault avoidance** $\rightarrow$ Evitare i guasti per es. scegliendo componenti migliori.
-   **Fault tolerance** $\rightarrow$ tolleranza ai guasti per es. introducendo livelli di ridondanza.

Un esempio comune di tolleranza ai guasti è il **RAID** (**Redundant Array of Independent Disks**), utilizzato nei
sistemi di archiviazione critici per proteggere i dati da guasti hardware.

## Disponibilità

La disponibilità di un sistema è influenzata dal tempo necessario per ripararlo, misurato dal **MTTR (Mean Time To
Repair)**.

L'**availability** si calcola con la formula:

$$
Availability = \frac{MTTF}{MTTF + MTTR}
$$

Un'alta disponibilità è essenziale nei sistemi critici, dove il tempo di inattività deve essere ridotto al minimo.

# Dispositivi di I/O

Ogni dispositivo esterno si collega al computer tramite un **modulo di I/O**, questi dispositivi sono noti come
**periferiche** e si dividono in:

1. **Human-readable** $\rightarrow$ Per l'interazione con l’utente (es. monitor, tastiere, stampanti).
2. **Machine-readable** $\rightarrow$ Per la comunicazione con altri dispositivi (es. dischi magnetici, nastri, sensori,
   attuatori).
3. **Comunicazione** $\rightarrow$ Per lo scambio di dati con dispositivi remoti, come terminali o altri computer.

Essi si interfacciano con il modulo di I/O tamite tre tipi di segnali:

-   **Controllo** $\rightarrow$ Definiscono le operazioni del dispositivo (es. lettura, scrittura, segnalazione dello
    stato).
-   **Dati** $\rightarrow$ Insieme di bit trasferiti tra il dispositivo e il modulo di I/O.
-   **Stato** $\rightarrow$ Indicano se il dispositivo è pronto per il trasferimento dati (es. READY/NOT-READY).

![](./img/generic_io_device.drawio.png)

Un **buffer** è spesso presente per memorizzare temporaneamente i dati trasferiti. Nei dispositivi seriali è solitamente
di 8-16 bit, mentre nei dispositivi a blocchi (es. dischi) può essere molto più grande.

# Modulo I/O

I **moduli di I/O** non sono semplici connettori, ma contengono logica per trasferire dati tra il bus di sistema e i
dispositivi esterni, poichè questi ultimi hanno velocità, formati e funzionamenti incompatibili con il **bus di
sistema**.

Per risolvere questi problemi, i **moduli di I/O** svolgono due funzioni principali:

1. **Interfacciarsi con il processore e la memoria** tramite il bus di sistema.
2. **Gestire la comunicazione con le periferiche** tramite collegamenti dati dedicati.

## Funzioni del modulo

Le principali funzioni o requisiti di un modulo I/O rientrano nelle seguenti categorie:

-   Controllo e temporizzazione
-   Comunicazione con il processore
-   Comunicazione con il dispositivo
-   Bufferizzazione dei dati
-   Rilevamento degli errori

Visto che le risorse interne, come la memoria principale e il bus di sistema, devono essere condivise tra diverse
attività, incluso l'I/O dei dati, la funzione di I/O include un requisito di controllo e temporizzazione per coordinare
il flusso del traffico tra risorse interne e dispositivi esterni.

Se il sistema utilizza un bus, ciascuna delle interazioni tra il processore e il modulo I/O implica una o più arbitrati
del bus.

Il modulo I/O deve comunicare sia con il processore che con il dispositivo esterno. La comunicazione con il processore
coinvolge:

-   **Decodifica dei comandi** $\rightarrow$ Il modulo I/O accetta comandi dal processore, solitamente inviati come
    segnali sul bus di controllo.
-   **Dati** $\rightarrow$ I dati vengono scambiati tra il processore e il modulo I/O attraverso il bus dati.
-   **Segnalazione di stato** $\rightarrow$ Poiché le periferiche sono molto lente rispetto al processore, è importante
    conoscere lo stato del modulo I/O.
-   **Riconoscimento dell'indirizzo** $\rightarrow$ Il modulo I/O deve riconoscere un indirizzo di memoria univoco per
    ogni periferica che controlla.

Mentre la comunicazione con il dispositivo coinvolge:

-   comandi;
-   informazioni di stato;
-   dati.

Una funzione essenziale di un modulo I/O è la **bufferizzazione dei dati**. La necessità di questa funzione è evidente
dalle differenze di velocità tra i dispositivi.

-   I dati provenienti dalla memoria principale vengono inviati rapidamente al modulo I/O, che li memorizza
    temporaneamente per poi inviarli al dispositivo alla velocità appropriata.
-   Viceversa, i dati in ingresso vengono bufferizzati per evitare di impegnare la memoria con trasferimenti lenti.

Se il dispositivo opera a una velocità superiore a quella di accesso alla memoria, il modulo I/O deve comunque gestire
la bufferizzazione per sincronizzare i tassi di trasferimento.

Infine, un modulo I/O è spesso responsabile del **rilevamento degli errori** e della successiva segnalazione al
processore.

Esistono due principali classi di errori:

1. **Errori meccanici ed elettrici** $\rightarrow$ Malfunzionamenti segnalati dal dispositivo.
2. **Errori di trasmissione** $\rightarrow$ Modifiche non intenzionali ai dati trasmessi tra il dispositivo e il modulo
   I/O.

Spesso vengono usati codici di rilevamento degli errori per identificare gli errori di trasmissione.

## Struttura del modulo I/O

I moduli di I/O variano notevolmente in complessità e nel numero di dispositivi esterni che controllano. Qui forniremo
solo una descrizione generale.

Ecco un diagramma a blocchi di un generale modulo di I/O:

![](./img/controller_IO.png)

Il modulo si collega al resto del computer attraverso un insieme di linee di segnale.

Poi ci sono vari registri:

-   **registri dati** in cui si memorizzano temporaneamente i dati da e verso il modulo.
-   **Registri di stato** che forniscono informazioni sullo stato attuale.
-   **Registro di controllo**, accetta informazioni di controllo dettagliate dal processore, può coincidere con il
    **registro di stato**.

La logica interna del modulo interagisce con il processore tramite un insieme di linee di controllo.

Il processore utilizza queste linee per inviare comandi al modulo di I/O. Alcune di queste linee possono essere usate
dal modulo di I/O per funzioni come l'arbitraggio e i segnali di stato. Il modulo deve anche essere in grado di
riconoscere e generare indirizzi associati ai dispositivi che controlla.

Ogni modulo di I/O ha un indirizzo univoco o, se controlla più dispositivi esterni, un insieme di indirizzi univoci.
Infine, il modulo di I/O contiene una logica specifica per l'interfaccia con ciascun dispositivo che controlla.

Un modulo di I/O permette al processore di interagire con un'ampia gamma di dispositivi in modo semplificato nascondendo
i dettagli relativi ai tempi, ai formati e agli aspetti elettromeccanici di un dispositivo esterno, in modo che il
processore possa operare con semplici comandi di lettura e scrittura, e possibilmente con comandi di apertura e chiusura
file.

Nella sua forma più semplice, il modulo di I/O può comunque lasciare visibili al processore molte delle operazioni di
controllo di un dispositivo.

Un modulo di I/O che si occupa della maggior parte del carico di elaborazione dettagliato, presentando un'interfaccia ad
alto livello al processore, è solitamente chiamato **canale di I/O** o **processore di I/O**.

Un modulo di I/O più primitivo, che richiede un controllo dettagliato, è generalmente chiamato **controller di I/O** o
**controller di dispositivo**.

I controller di I/O sono comunemente utilizzati nei microcomputer, mentre i canali di I/O sono impiegati nei mainframe.

# Bus

Per far comunicare il processore con i dispositivi di I/O c'è bisogno di un **bus**.

Un **bus** è un insieme di **linee dati** trattate come un unico segnale logico, utilizzato per connettere più
dispositivi all'interno di un sistema. Le periferiche collegate a un bus condiviso vengono chiamate **taps**.

## Caratteristiche principali

Il **bus** rappresenta un mezzo di trasmissione condiviso, in cui più dispositivi possono essere connessi e scambiarsi
dati.

I **taps** sono i dispositivi che possono inviare o ricevere dati attraverso il bus.

Le **prestazioni** del bus dipendono da diversi fattori, tra cui:

-   **Lunghezza fisica** del bus.
-   **Numero di dispositivi** collegati, poiché un numero elevato di taps può influenzare la velocità di trasmissione.

## Gestione dell'accesso al bus

Poiché il bus è una risorsa condivisa, **solo un dispositivo alla volta può trasmettere con successo**. Se più
dispositivi tentano di trasmettere contemporaneamente, si possono verificare conflitti.

Per evitare questo problema, si utilizza un meccanismo di **arbitraggio del bus**, che assegna l’accesso ai dispositivi
in base a criteri di priorità e correttezza, garantendo una comunicazione efficiente e priva di interferenze.

## System Bus

Collega il **processore** e la **memoria**, mentre il bus di I/O è connesso tramite adattatori.

**Caratteristiche**:

-   **Corto**, con pochi dispositivi collegati $\rightarrow$ **veloce e ad alta larghezza di banda**.
-   **Non standard**, varia in base al sistema.

**Esempi**: Front-Side Bus (FSB), QPI.

## I/O Bus

Collega i **dispositivi di I/O**, senza connessione diretta a processore e memoria.

**Caratteristiche**:

-   **Più lungo**, con più dispositivi $\rightarrow$ **più lento e con minore larghezza di banda**.
-   **Standard industriale**.

**Esempi**: PCI, PCIe, USB, SATA.

![Bus di sistema e bus di I/O](./img/BUS_sistema_IO.png)

## Backplane Bus

Collega **CPU, memoria e dispositivi di I/O** in un'unica infrastruttura.

**Caratteristiche**:

-   **Molto lungo**, con molti dispositivi collegati $\rightarrow$ **velocità media o bassa**.
-   Supporta dispositivi con **diverse larghezze di banda**.
-   **Standard industriale**.

**Esempi**: VMEbus, Multibus.

![Backplane Bus](./img/BUS_backplane.png)

## Progettazione del Bus

La progettazione di un bus deve bilanciare **prestazioni, standardizzazione e costi**.

I diversi tipi di bus hanno obiettivi differenti:

-   Il **System Bus** privilegia le **prestazioni**;
-   i **bus di I/O e Backplane** puntano sulla **standardizzazione e sulla riduzione dei costi**.

Nella progettazione di un Bus un primo aspetto da considerare è se i suoi **fili siano condivisi o separati**.

Un **bus più largo** consente una maggiore larghezza di banda, ma comporta anche **costi più elevati** e un rischio
maggiore di **skew**, ossia disallineamenti nei segnali che possono compromettere il corretto funzionamento del sistema.

Un altro elemento critico riguarda la **gestione del controllo del bus**. Esistono due principali strategie:

### Transazioni atomiche

Le **transazioni atomiche**, che completano una comunicazione alla volta.

Questa soluzione è **più semplice da implementare**, ma porta a un utilizzo **meno efficiente** del bus.

### Split-transactions

Le **split-transactions**, che permettono di interlecciare richieste e risposte di più dispositivi.

Questo approccio migliora l’**utilizzo del bus**, ma introduce una **maggiore complessità di gestione**, richiedendo ad
esempio l’uso di identificatori per distinguere le diverse richieste.

Inoltre il bus può essere **sincrono** o **asincrono**:

### Sincrono

Nel caso di un bus sincrono, tutti i dispositivi collegati condividono lo stesso segnale di clock.

Questo significa che tutte le operazioni avvengono in corrispondenza di un fronte di salita del clock, garantendo una
sincronizzazione precisa tra i dispositivi.

Un possibile protocollo di comunicazione tra due unità, **A** e **B**, potrebbe funzionare nel seguente modo:

-   Al ciclo di clock $X$, l'unità **A** scrive una richiesta di **LETTURA** sul bus.
-   Dopo un intervallo di tempo massimo pari a $\Delta$, ovvero al ciclo $X + \Delta$, l'unità **A** legge i dati dal
    bus.
-   Il valore di $\Delta$ rappresenta il tempo massimo richiesto dall'unità **B** per scrivere i dati sul bus.

Uno dei problemi principali che può emergere in un bus sincrono è lo **skew del clock**, ovvero un disallineamento del
segnale di clock tra i vari dispositivi connessi.

Questo fenomeno può portare a errori nella comunicazione se i segnali non arrivano simultaneamente a tutti i nodi del
bus.

A causa di questa limitazione, i bus sincroni sono solitamente **di lunghezza ridotta**, come nel caso dei **bus di
sistema** all'interno di un computer, dove la velocità di trasferimento è prioritaria rispetto alla distanza coperta.

### Asincrono

A differenza del bus sincrono, un **bus asincrono** non utilizza un segnale di clock globale.

Ciò elimina il problema dello skew del clock, ma rende necessaria l'implementazione di un **protocollo di handshaking**,
un meccanismo di sincronizzazione che permette ai dispositivi di comunicare correttamente senza una temporizzazione
predefinita.

L'assenza di un clock permette al bus di coprire distanze maggiori rispetto a un bus sincrono, ma ciò si traduce
generalmente in una velocità di trasferimento inferiore.

Un possibile protocollo di comunicazione asincrono, basato su **tre linee di controllo** e **una linea dati** (su cui
vengono multiplexati indirizzi e dati), può funzionare nel seguente modo:

1. L'unità **UIO1** scrive una richiesta di **LETTURA (o SCRITTURA)** sulla linea di controllo (_ReadReq_ o _WriteReq_),
   mentre l'indirizzo della memoria o del dispositivo da cui leggere i dati viene scritto sulla linea dati.
2. L'unità **UIO2**, dopo aver ricevuto l'indirizzo, invia un segnale di **ACK** (acknowledge) sulla linea di controllo
   a **UIO1**, indicando di aver ricevuto correttamente la richiesta.
3. **UIO2** scrive i dati sul bus e invia il segnale **DataReady** sulla linea di controllo per notificare a **UIO1**
   che i dati sono disponibili.
4. L'unità **UIO1** legge i dati dalla linea dati e invia un **ACK** a **UIO2** per confermare l'avvenuta ricezione.

Questo tipo di comunicazione consente una maggiore flessibilità, ma introduce una latenza maggiore rispetto ai bus
sincroni, poiché ogni operazione richiede un numero maggiore di scambi tra i dispositivi prima che la trasmissione possa
considerarsi completata.

Infine, è fondamentale stabilire **chi può accedere al bus** in presenza di più dispositivi che desiderano trasmettere
dati contemporaneamente:

## Arbitraggio del Bus

L'arbitraggio è un **protocollo di comunicazione** che serve a garantire un utilizzo corretto delle risorse condivise.

Quando più dispositivi cercano di accedere al bus contemporaneamente, il meccanismo di **arbitraggio** sceglie quale
dispositivo può ottenere il controllo, tenendo conto di criteri di **priorità** e **equità** (evitando il problema della
starvation).

L'unità che ha la capacità di iniziare una richiesta sul bus è detta **bus master**.

-   La configurazione più semplice prevede un solo master.
-   Alcuni bus possono supportare **più master**, consentendo a diverse unità di richiedere l'accesso al bus.

L'**arbiter** è il componente responsabile della gestione delle richieste e dell'assegnazione del bus, garantendo un
equilibrio tra **priorità** ed **equità**.

L'arbitraggio può essere realizzato seguendo due approcci principali:

### Arbitraggio Centralizzato

Un dispositivo dedicato (**Arbiter**) raccoglie tutte le richieste e decide quale unità può accedere al bus.

Questo modello è semplice, ma può diventare un **collo di bottiglia**.

Ci sono due implementazioni principali per questo approccio:

-   **Daisy-chain**: semplice da implementare, ma poco equo.
-   **Con linee di richiesta/risposta indipendenti**: metodo ampiamente utilizzato, migliora l'equità e riduce i
    ritardi.

### Arbitraggio Distribuito

Ogni dispositivo è in grado di vedere le richieste contemporaneamente e partecipa al processo di selezione del master
successivo.

Questo metodo è più **complesso** da realizzare e richiede un **numero elevato di linee di controllo**, ma elimina il
problema del collo di bottiglia dell'approccio centralizzato.

## Daisy-Chain Arbiter

Il metodo **Daisy-Chain** è un tipo di arbitraggio centralizzato in cui i dispositivi sono connessi al bus in ordine di
priorità.

-   I dispositivi con **priorità più alta** sono posizionati più vicini all'**arbiter**.
-   I dispositivi con **priorità più alta** possono **intercettare o negare** le richieste provenienti da dispositivi
    con priorità inferiore.

### Vantaggi e Svantaggi

-   :white_check_mark: **Semplice da implementare**
-   :x: **Lento**
-   :x: **Non garantisce equità**, poiché i dispositivi con priorità inferiore possono rimanere senza accesso al bus
    (**starvation**).

![Daisy-Chain Arbiter](./img/daisy_chain_arbiter.png)

### Funzionamento

-   **Linea di richiesta (Request Line)**: è una **wired-OR line**, ovvero una linea condivisa in cui più dispositivi
    possono effettuare richieste.
-   **Linea di concessione (Grant Line)**: il segnale di concessione viene propagato attraverso tutti i dispositivi.

Se un dispositivo ha effettuato una richiesta, prenderà il controllo del bus non appena riceve il segnale di
concessione.

Una volta ottenuto il controllo, il dispositivo **disattiva la grant line**, impedendo agli altri di accedere al bus
finché non termina la sua operazione.

## Centralized Arbiter

Il metodo **Centralized Arbiter** utilizza un arbitro dedicato che gestisce l'accesso al bus attraverso **canali
indipendenti** di richiesta (**req**) e concessione (**grant**) per ciascun dispositivo.

### Caratteristiche

-   **Controllo centralizzato**: i dispositivi comunicano direttamente con l'arbiter.
-   L'arbiter assegna l'accesso al bus in base a:
    -   **Priorità**: alcuni dispositivi hanno una priorità più alta (**fissa o dinamica**).
    -   **Round-robin**: i dispositivi vengono serviti in ordine ciclico per garantire equità.

### Vantaggi e Svantaggi

-   :white_check_mark: **Gestione efficiente delle richieste**
-   :x: **Single Point of Failure (SPOF)**: se l’arbiter si guasta, l’intero sistema si blocca.

![Centralized arbiter](./img/centralized_arbiter.png)

### Funzionamento

-   **Linea di richiesta (Request Line)**: ogni dispositivo invia una richiesta all'arbiter tramite una linea dedicata.
-   **Linea di concessione (Grant Line)**: l'arbiter concede l'accesso al bus al dispositivo selezionato attivando la
    relativa linea di grant.

Se più dispositivi fanno richiesta contemporaneamente, l'arbiter decide in base alla **priorità** o al **round-robin**.

Il dispositivo selezionato prende il controllo del bus ed esegue la sua operazione.

Una volta terminata, il dispositivo rilascia il bus e l'arbiter può assegnarlo a un altro richiedente.

# Tecniche di Operazioni di I/O

Tre tecniche sono possibili per le operazioni di I/O:

Con il **Programmed I/O**, il processore deve attendere fino al completamento dell'operazione di I/O.

Con l'**Interrupt-driven I/O**, il processore continua a eseguire altre istruzioni e viene interrotto dal modulo di I/O
quando quest'ultimo ha completato il suo lavoro.

Con entrambi gli approcci il processore è responsabile dell'estrazione e della meorizzazione dei dati.

L'alternativa è nota come **accesso diretto alla memoria (DMA)**. In questa modalità, il modulo di I/O e la memoria
principale scambiano dati direttamente, senza il coinvolgimento del processore.

La seguente tabella indica la relazione tra queste tre tecniche.

|                                 | Nessuna interruzione | Interruzioni               |
| ------------------------------- | -------------------- | -------------------------- |
| Tasferimento tramite processore | Programmed I/O       | Interrupt-driven I/O       |
| Trasferimento diretto           |                      | Direct memory access (DMA) |

## Programmed I/O

Quando il processore esegue un programma e incontra un'istruzione relativa all'I/O, esegue quell'istruzione inviando un
comando al modulo di I/O appropriato.

Con l'I/O programmato, il modulo di I/O eseguirà l'azione richiesta e poi imposterà i bit appropriati nel registro di
stato dell'I/O. Il modulo di I/O non intraprende ulteriori azioni per avvisare il processore. In particolare, non
interrompe il processore.

Pertanto, è responsabilità del processore controllare periodicamente lo stato del modulo di I/O fino a quando non
verifica che l'operazione sia completata.

### Comandi I/O

Per eseguire un'istruzione relativa all'I/O, il processore emette un indirizzo, specificando il modulo di I/O, il
dispositivo esterno, e un comando di I/O.

Esistono quattro tipi di comandi di I/O che un modulo di I/O può ricevere quando viene indirizzato da un processore:

-   **Control**: Utilizzato per attivare una periferica e dirle cosa fare, questi comandi sono specifici per il tipo di
    periferica.
-   **Test**: Utilizzato per verificare varie condizioni di stato associate a un modulo di I/O e alle sue periferiche.
-   **Read**: Fa sì che il modulo di I/O ottenga un dato dalla periferica e lo collochi in un buffer interno.
-   **Write**: Fa sì che il modulo di I/O prenda un dato dal bus dati e lo trasmetta successivamente alla periferica.

I dati vengono letti una parola alla volta. Per ogni parola letta, il processore deve rimanere in un ciclo di controllo
dello stato fino a quando non determina che la parola è disponibile nel registro dati del modulo di I/O.

Il principale svantaggio di questa tecnica consiste nel fatto che il processo richiede molto tempo e mantiene il
processore occupato inutilmente.

### Istruzioni I/O

Il Programmed I/O stabilisce una corrispondenza diretta tra le istruzioni di I/O del processore e i comandi inviati ai
moduli di I/O.

Ogni dispositivo di I/O ha un indirizzo univoco, e il modulo di I/O deve interpretare le linee di indirizzo per
riconoscere i comandi a lui destinati.

Esistono due modalità di indirizzamento dell'I/O:

-   **Memory-mapped I/O**: utilizza un unico spazio di indirizzamento per memoria e I/O, trattando i registri di stato e
    dati dei moduli di I/O come posizioni di memoria. Ciò permette l'uso delle normali istruzioni di memoria per l'I/O,
    ma riduce lo spazio disponibile per la memoria.
-   **Isolated I/O**: separa lo spazio di indirizzamento della memoria da quello dell'I/O, rendendo le porte di I/O
    accessibili solo tramite istruzioni specifiche. Questo preserva lo spazio di memoria ma limita il set di istruzioni
    disponibili per l'I/O.

Il memory-mapped I/O consente una programmazione più efficiente grazie alla varietà di istruzioni utilizzabili, mentre
l’isolated I/O evita il consumo di spazio di memoria per l'I/O. Entrambi i metodi sono comunemente impiegati nei sistemi
moderni.

## Interrupt-driven I/O

il Programming I/O è inefficiente perché il processore deve attendere che il modulo di I/O sia pronto, interrogando
ripetutamente il suo stato, il che degrada le prestazioni del sistema.

Con l'**Interrupt-driven I/O**, il processore invia un comando di I/O e prosegue con altre operazioni. Quando il modulo
di I/O è pronto, genera un’interruzione per notificare al processore che i dati possono essere trasferiti. Il processore
salva il contesto del programma in esecuzione, esegue il trasferimento dei dati e poi riprende il programma interrotto.

Questa tecnica è più efficiente rispetto all'I/O programmato perché elimina le attese inutili, ma ancora dispendiosa in
termini di tempo del processore, poiché ogni trasferimento di dati deve passare attraverso di esso.

### Interrupt Processing

Quando un dispositivo I/O completa un'operazione, si attiva un'interruzione che il processore gestisce seguendo questa
sequenza di eventi:

1. Il dispositivo invia un segnale di interruzione al processore.
2. Il processore completa l'istruzione corrente prima di rispondere all'interruzione.
3. Il processore verifica la presenza di un'interruzione, la riconosce e invia un segnale di conferma al dispositivo,
   che può così rimuovere il segnale di interruzione.
4. Il processore prepara il trasferimento del controllo alla routine di gestione dell'interruzione, salvando lo stato
   attuale:
    - Lo stato del processore (contenuto nel **Program Status Word - PSW**)
    - L'indirizzo della prossima istruzione (contenuto nel **Program Counter**)
    - Queste informazioni vengono salvate nello **stack di controllo**.
5. Il processore carica il program counter con l'indirizzo della routine di gestione dell’interruzione. Se esistono più
   routine, il processore determina quale eseguire in base alle informazioni ricevute con l'interruzione.
6. La routine di gestione salva il contenuto dei registri del processore nello stack, poiché questi potrebbero essere
   utilizzati durante la gestione dell'interruzione.
7. L'interrupt handler elabora l'interruzione, esaminando lo stato del dispositivo e inviando eventuali comandi o
   conferme necessari.
8. Una volta terminata l'elaborazione, i valori dei registri vengono ripristinati dallo stack.
9. Infine, il processore ripristina il **PSW** e il **Program Counter**, riprendendo l'esecuzione del programma
   interrotto.

Poiché le interruzioni possono verificarsi in qualsiasi momento durante l'esecuzione di un programma, è fondamentale
salvare completamente lo stato del processore per garantirne il corretto ripristino.

### Problemi di design

Due problemi principali sorgono nell'implementazione dell'I/O basato su interrupt:

#### 1. Identificazione del Dispositivo

Il processore deve determinare quale modulo di I/O ha generato l'interrupt. Le tecniche principali includono:

-   **Linee di interrupt multiple**: Limitate dal numero di linee disponibili.
-   **Software poll**: Il processore interroga i moduli I/O in sequenza, ma è inefficiente.
-   **Daisy chain (polling hardware, interrupt vettoriali)**: Un segnale di riconoscimento viene propagato in cascata
    fino al modulo richiedente.
-   **Arbitraggio del bus (interrupt vettoriali)**: Il modulo di I/O richiedente ottiene il controllo del bus prima di
    inviare l'interrupt.

#### 2. Gestione di Interrupt Multipli

Se più moduli generano un interrupt contemporaneamente, il processore deve stabilire le priorità. Le strategie
includono:

-   **Priorità fissa**: Alcuni moduli hanno precedenza su altri.
-   **Polling software o daisy chain**: L'ordine dei moduli determina la priorità.
-   **Arbitraggio del bus**: Il modulo con priorità più alta ottiene accesso al bus prima.

Queste tecniche garantiscono un'efficiente gestione degli interrupt nel sistema.

## Direct Memory Access (DMA)

L'Interrupt-driven I/O, pur essendo più efficiente del Programmed I/O, tuttavia libera solo in parte il processore e
riduce la velocità di trasferimento dei dati.

La soluzione per grandi volumi di dati è il **DMA (Direct Memory Access)**, che riduce il coinvolgimento del processore
nel processo di trasferimento.

### Funzionamento

Il DMA prevede l’aggiunta di un modulo dedicato sul bus di sistema, capace di assumere il controllo della comunicazione
per trasferire dati direttamente tra memoria e dispositivi I/O senza coinvolgere continuamente il processore.

Quando il processore desidera trasferire un blocco di dati, invia al modulo DMA le seguenti informazioni:

-   Tipo di operazione (lettura o scrittura).
-   Indirizzo del dispositivo I/O coinvolto.
-   Indirizzo di memoria da cui leggere o scrivere.
-   Numero di parole da trasferire.

Una volta ricevuto il comando, il modulo DMA gestisce il trasferimento autonomamente, senza passare per il processore.

Quando il trasferimento è completato, il modulo invia un segnale di interrupt al processore per notificare la
conclusione dell’operazione.

Per utilizzare il bus di sistema senza conflitti con il processore, il DMA impiega la tecnica del **cycle stealing**,
sospendendo temporaneamente il processore per un ciclo di bus ogni volta che necessita di trasferire un dato.

Ciò rallenta leggermente l’esecuzione del processore, ma è molto più efficiente rispetto ai metodi precedenti.

Esistono diverse configurazioni per l’integrazione del DMA nel sistema:

-   **Bus condiviso**: il modulo DMA utilizza il bus di sistema per trasferire dati tra memoria e dispositivi I/O,
    consumando due cicli bus per ogni trasferimento.
-   **DMA con connessione diretta ai dispositivi I/O**: il modulo DMA scambia dati con i dispositivi senza passare per
    il bus di sistema, riducendo il numero di cicli bus necessari.
-   **DMA con bus I/O separato**: i dispositivi I/O comunicano con il modulo DMA tramite un bus dedicato, migliorando
    l’efficienza e l’espandibilità del sistema.

### Virtual vs physical DMA

Il **Virtual DMA** esegue la traduzione degli indirizzi tramite una cache TLB inizializzata dal sistema operativo,
permettendo trasferimenti complessi attraverso più pagine di memoria, ma con maggiore complessità.

Il **Physical DMA**, invece, opera con indirizzi fisici e trasferisce dati a livello di pagine, richiedendo al sistema
operativo di suddividere grandi trasferimenti in blocchi, risultando più semplice ma meno flessibile.

### DMA and caching

La **cache** riduce la latenza di accesso alle istruzioni e ai dati della CPU, oltre a diminuire l'uso della memoria da
parte della CPU, lasciando così maggiore larghezza di banda per i trasferimenti DMA.

Tuttavia, introduce un problema di **coerenza**: se il DMA scrive direttamente nella memoria principale, i dati
memorizzati nella cache possono diventare obsoleti.

Con cache **write-back (WB)**, il controller DMA potrebbe leggere dati non aggiornati dalla memoria mentre quelli
aggiornati sono ancora nella cache con il **dirty-bit** attivo.

La soluzione consiste nel **flush selettivo o nell'invalidazione** delle linee di cache coinvolte nei trasferimenti DMA,
richiedendo ulteriore logica hardware per garantire la coerenza della cache.
