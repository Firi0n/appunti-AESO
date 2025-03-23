La logica sequenziale può ricordare esplicitamente alcuni ingressi precedenti, riassumendoli in **stati**.

Lo **stato** di una rete digitale sequenziale è un insieme di bit, detto **variabili di stato**, che contiene tutte le
informazioni sul passato necessarie a spiegare il comportamento futuro della rete.

# Latch e flip-flop

Il blocco costitutivo fondamentale di memoria è un elemento bistabile, cioè un elemento con due stati stabili.

## Latch SR

Il latch ha due ingressi, $S$ e $R$, e due uscite, $Q$ e $\overline{Q}$.

| S   | R   | $Q_{next}$ | $\overline{Q_{next}}$ |
| --- | --- | ---------- | --------------------- |
| 0   | 0   | $Q$        | $\overline{Q}$        |
| 0   | 1   | 0          | 1                     |
| 1   | 0   | 1          | 0                     |
| 1   | 1   | 0          | 0                     |

![](./img/latch_sr.drawio.svg)

## Latch D

Il **latch SR** è scomodo in quanto si comporta in maniera imprevedibile quando entrambi gli ingressi, **S** e **R**,
sono attivati simultaneamente, inoltre, questi ingressi controllano sia il **modo** in cui lo stato cambia che il
**momento** in cui avviene il cambiamento. La progettazione delle reti diventa più semplice se questi due aspetti, il
"**modo**" e il "**momento**", vengono trattati separatamente. Il **latch D** è una soluzione a questi problemi.

Questo latch ha due ingressi: un ingresso **dati**, **D**, che controlla il prossimo stato, e un ingresso **clock**,
**CLK**, che controlla invece il momento del cambio di stato.

| CLK | $D$ | $\overline{D}$ | $S$ | $R$ | $Q$        | $\overline{Q}$        |
| --- | --- | -------------- | --- | --- | ---------- | --------------------- |
| 0   | $X$ | $\overline{X}$ | 0   | 0   | $Q_{prec}$ | $\overline{Q_{prec}}$ |
| 1   | 0   | 1              | 0   | 1   | 0          | 1                     |
| 1   | 1   | 0              | 1   | 0   | 1          | 0                     |

![](./img/latch_d.drawio.svg)

## Flip-flop D

Il **latch D** soffre del problema della **trasparenza**, poiché l'uscita segue l'ingresso quando il clock è a 1,
rendendo **instabile** il sistema se l'ingresso cambia durante questo stato. Al contrario, il **flip-flop D** risolve
questo problema aggiornando l'uscita solo al fronte di salita del clock (quando passa da 0 a 1), evitando che l'uscita
cambi continuamente e garantendo un comportamento **stabile** e **sincrono**.

Tuttavia, il f**lip-flop D** è tipicamente realizzato con una **coppia di latch** (uno controllato dal clock e uno dal
suo complemento), il che introduce una **latenza iniziale**: per ottenere il primo aggiornamento completo, sono
necessari **due cicli di clock**.

![](./img/flip-flop_d.drawio.svg)

## Registro

Un registro a **N** bit è un banco di **N flip-flop** che condividono un ingresso **CLK comune**, in modo che tutti i
bit vengano aggiornati allo stesso tempo. I registri costituiscono i blocchi costitutivi chiave per la maggior parte
delle **reti sequenziali**.

## Flip-flop con abilitazione

Un **flip-flop** con abilitazione aggiunge un altro ingresso, chiamato **EN** o **ENABLE**, per determinare se
**memorizzare** o no il dato sul **fronte del clock**.

![](./img/flip-flop_en.drawio.svg)

# Reti sequenziali sincrone

Le **reti sequenziali** contengono **percorsi ciclici** in cui le uscite sono collegate retroattivamente agli ingressi.
Queste reti possono avere **condizioni di corsa** e comportamenti instabili, rendendo l'analisi complessa. Per evitarli,
si introducono **registri**, trasformando la rete in una combinazione di logica combinatoria e registri. I registri
contengono lo stato del sistema, che cambia solo al fronte di clock.

Una **rete sequenziale sincrona** ha:

-   Un ingresso di clock.
-   Stati discreti $\{S_0, S_1, \ldots, S_{k-1}\}$.
-   Specifica funzionale per definire lo stato prossimo $S'$ e le uscite in base a $S$ e ingressi.
-   Specifica temporale con limiti $t_{pcq}$ e $t_{ccq}$, e tempi di **setup** $t_{setup}$ e **hold** $t_{hold}$.

Regole di composizione:

-   Ogni elemento è un registro o una rete combinatoria.
-   Deve esserci almeno un registro.
-   Tutti i registri ricevono lo stesso segnale di clock.
-   Ogni percorso ciclico contiene almeno un registro.

# Macchine a stati finiti

Le **reti sequenziali sincrone** possono essere rappresentate come **macchine a stati finiti** (FSM, finite state
machine). Una rete con $k$ registri può trovarsi in uno dei $2^k$ stati diversi. Una FSM ha:

-   $M$ ingressi,
-   $N$ uscite,
-   $k$ bit di stato,
-   un segnale di clock e, talvolta, un segnale di reset.

Una FSM è composta da due blocchi di logica combinatoria:

1. **Logica di stato prossimo**,
2. **Logica d’uscita**.

Un registro immagazzina lo stato della FSM. Ad ogni fronte di salita del clock, la FSM avanza allo stato prossimo,
determinato dagli ingressi e dallo stato presente.

Esistono due classi di macchine a stati finiti:

-   **Macchine di Moore**: le uscite dipendono solo dallo stato presente.
-   **Macchine di Mealy**: le uscite dipendono sia dallo stato presente sia dagli ingressi attuali.

Le macchine a stati finiti forniscono un metodo sistematico per progettare reti sequenziali sincrone, partendo dalla
specifica funzionale.

Per rappresentare una macchina a stati finiti si usano i seguenti simboli:

-   **Cerchi:** rappresentano gli stati;
-   **Archi:** rappresentano le transizioni, avvenendo al fronte di salita del clock;
-   L'arco **Reset:** indica che il sistema passa allo stato $S_0$ in caso di reset, indipendentemente dallo stato
    precedente;
-   Transizioni con più archi sono etichettate per mostrare quale ingresso causa la transizione.

Nel diagramma degli stati per le macchine di Moore i valori delle uscite vengono indicati nei cerchi, mentre, nelle
macchine di Mealy le uscite sono indicate negli archi.

# Temporizzazione nella logica sequenziale

Il **tempo di apertura** di un elemento sequenziale è definito dal tempo di **setup** e dal tempo di **hold**,
rispettivamente prima e dopo il fronte del clock. Nella disciplina dinamica, il tempo è composto da unità discrete
chiamate **cicli di clock**, e il segnale assume un valore finale stabilito al termine del ciclo. Si usa la notazione
$A[n]$ per indicare il valore del segnale $A$ alla fine dell’n-esimo ciclo di clock.

Il **periodo del clock** deve essere sufficientemente lungo per consentire a tutti i segnali di stabilizzarsi, il che
limita la velocità del sistema. Inoltre, il **sfasamento del clock** tra i flip-flop aumenta il periodo necessario.

In alcuni casi, come quando si interagisce con ingressi esterni (es. un pulsante), si può verificare la
**metastabilità**: un flip-flop campiona un valore incerto tra 0 e 1, richiedendo un tempo indefinito per tornare a un
valore logico stabile. Per gestire ingressi asincroni, si può utilizzare un **sincronizzatore**, anche se questo può
produrre valori logicamente scorretti, seppur con bassa probabilità.

La **disciplina dinamica** stabilisce che gli ingressi di una rete sequenziale sincrona devono rimanere stabili durante
il **tempo di apertura** (setup + hold) prima e dopo il fronte del clock. Questo assicura che i segnali vengano
campionati dal flip-flop quando sono stabili. Pertanto, i segnali possono essere considerati come discreti sia nel tempo
che nei livelli logici.

Il **periodo di clock** ($T_c$) è il tempo tra i fronti di salita del segnale di clock, e la sua frequenza
($f_c = \frac{1}{T_c}$) è misurata in Hertz (Hz). Aumentare la frequenza di clock aumenta la quantità di lavoro svolta
da un sistema digitale per unità di tempo.

Quando si calcola il periodo di clock in una rete sequenziale sincrona, il registro $R_1$ produce un'uscita ($Q_1$) al
fronte di salita del clock, che entra in un blocco di logica combinatoria per generare $D_2$, l'ingresso per il registro
$R_2$. I segnali d'uscita cambiano dopo un **ritardo di contaminazione** e si stabilizzano dopo un **ritardo di
propagazione**. Questi ritardi sono cruciali per analizzare i vincoli temporali relativi ai tempi di setup e hold del
registro $R_2$.

![](./img/ritardi.png)

Il **tempo di ciclo** ($T_c$) deve rispettare la condizione:

$$
T_c \geq t_{pcq} + t_{pd} + t_{setup}
$$

dove $t_{pcq}$ è il ritardo di propagazione da clock a Q e $t_{setup}$ è il tempo di setup del flip-flop. Il ritardo
massimo di propagazione attraverso la logica combinatoria può essere calcolato come:

$$
t_{pd} \leq T_c - (t_{pcq} + t_{setup})
$$

Il termine $t_{pcq} + t_{setup}$ è il **sovraccarico di sequenziamento**, che limita il tempo disponibile per la logica
combinatoria.

Per quanto riguarda il **tempo di hold**, l'ingresso $D_2$ di $R_2$ non deve cambiare per un certo periodo di tempo
($t_{hold}$) dopo il fronte di clock, esprimibile come:

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

I vincoli sul tempo di hold sono cruciali; se non vengono rispettati, è necessaria una riprogettazione della rete,
poiché non possono essere risolti aumentando il periodo del clock.

# Sincronizzatori

Per garantire dei livelli logici corretti, tutti gli ingressi asincroni dovrebbero essere fatti passare attraverso dei
sincronizzatori.

Un sincronizzatore riceve un ingresso asincrono $D$ e un clock $CLK$, producendo un’uscita $Q$. Se $D$ è stabile durante
il tempo di apertura, $Q$ riflette il valore di $D$. Se $D$ cambia durante il tempo di apertura, $Q$ può essere ALTO o
BASSO, ma non meta-stabile.

Un sincronizzatore può essere realizzato con due flip-flop.

![](./img/sincronizzatore.drawio.svg)

Un sincronizzatore fallisce se $Q$ diventa metastabile, ciò può accadere se l'uscita intermedia $D_2$ non si stabilizza
prima di essere campionata. La probabilità di errore per un cambiamento di un ingresso è data da:

$$P(errore) = \frac{T_{0}}{T_{c}}e^{-\frac{T_{c}-T_{setup}}{\tau}}$$

La **probabilità di errore**, $P(\text{errore})$, è la probabilità che l'uscita $Q$ diventi metastabile a causa di un
cambiamento in $D$. Se $D$ cambia $N$ volte al secondo, la probabilità di errore diventa:

$$P(errore)/sec = N_0 \frac{T}{T_c} e^{-\frac{T_c - T_{setup}}{\tau}}$$

L'**affidabilità** di un sistema si misura con il **tempo medio tra errori** (MTBF). Il **MTBF** è il reciproco della
probabilità che il sistema generi un errore in un istante dato:

$MTBF = \frac{1}{P(errore)/sec} = \frac{T_c}{NT_0} e^{-\frac{T_c - T_{setup}}{\tau}}$

Il **MTBF** aumenta esponenzialmente con il tempo di attesa $T_c$. Nei sistemi veloci, possono servire più cicli di
clock.

# Parallelismo

La **velocità** di un sistema è data da **latenza** e **throughput**. La latenza è il tempo impiegato da un token (un
gruppo di dati) per attraversare il sistema, mentre il throughput indica quanti token possono essere elaborati per unità
di tempo.

Il **throughput** aumenta elaborando più token simultaneamente, attraverso il **parallelismo**, che può essere di due
tipi: **spaziale**, che utilizza più copie dell'hardware per eseguire più lavori contemporaneamente, o **temporale**
(**pipelining**), divide i compiti in fasi, permettendo l'esecuzione sovrapposta di più compiti.

La **capacità produttiva** di un sistema senza parallelismo è $1/L$, dove $L$ è la latenza. Con **parallelismo
spaziale** e $N$ copie dell'hardware, diventa $N/L$. Nel **parallelismo temporale** (pipelining), il compito viene
diviso in $N$ fasi, mantenendo una capacità di $N/L$ con un'unica copia dell'hardware. Tuttavia, se le fasi hanno durate
diverse, la capacità produttiva è $1/L_1$, dove $L_1$ è la latenza della fase più lunga.

Il parallelismo temporale migliora la capacità produttiva dividendo la logica in stadi più semplici. L'inserimento di
registri tra blocchi di logica consente un clock più veloce, aumentando il throughput ma con un leggero aumento della
latenza. Il parallelismo è limitato dalle dipendenze tra operazioni, che possono impedire l'esecuzione simultanea di più
compiti.
