# Definizione di Sistema Operativo

I **sistemi operativi (OS)** sono software fondamentali che gestiscono le risorse del dispositivo, permettendo agli
utenti e alle applicazioni di interagire con l'hardware.

## Complessità e Accessibilità

I concetti di sistemi operativi sono tra i più complessi in informatica: un moderno sistema operativo generico può
superare **50 milioni di righe di codice**. Tuttavia, nonostante questa complessità, molti concetti sono familiari e
intuitivi, poiché riflettono situazioni comuni come il **multitasking** o la **gestione di risorse condivise**.

Capire il funzionamento dei sistemi operativi è essenziale per chi vuole progettare sistemi moderni e robusti. Inoltre,
molte tecnologie utilizzate per i sistemi operativi si ritrovano anche in altri ambiti, come il **cloud computing**, i
**browser web**, i **database** e i **giochi multiplayer**.

# I Ruoli del Sistema Operativo

I sistemi operativi svolgono tre ruoli fondamentali:

1. **Arbitro (Referee)**: gestiscono le risorse condivise tra più applicazioni, garantendo l'isolamento e la protezione
   da guasti o virus. Decidono inoltre come allocare le risorse e quando.

2. **Illusionista (Illusionist)**: creano astrazioni hardware per semplificare la progettazione delle applicazioni,
   fornendo l'illusione di memoria infinita e processori dedicati, anche se la realtà fisica è limitata.

3. **Collante (Glue)**: offrono servizi comuni per favorire la comunicazione tra applicazioni, come il supporto per il
   copia e incolla, l'accesso uniforme ai file e la gestione delle interfacce utente.

# Principali Obiettivi di Progettazione

## Affidabilità e Disponibilità

L'affidabilità garantisce che il sistema faccia sempre ciò per cui è stato progettato. La disponibilità misura quanto
spesso il sistema è accessibile. La progettazione robusta e l'isolamento dei guasti sono fondamentali per mantenere sia
l'affidabilità che la disponibilità.

## Sicurezza e Privacy

La sicurezza protegge il sistema da attacchi esterni e da malware, mentre la privacy garantisce che i dati siano
accessibili solo agli utenti autorizzati. Le minacce alla sicurezza sono inevitabili, ma il sistema operativo deve
limitare i rischi attraverso l'isolamento delle applicazioni e il controllo rigoroso degli accessi.

## Portabilità

Un buon sistema operativo deve essere **portabile** tra diversi hardware senza richiedere modifiche significative.
Questo è possibile grazie a un livello di astrazione tra software e hardware, come l'**Abstract Virtual Machine (AVM)**
e l'**Hardware Abstraction Layer (HAL)**.

## Prestazioni

Le prestazioni si misurano in termini di **efficienza**, **tempo di risposta**, **attraversamento (throughput)** e
**prevedibilità**. Un sistema operativo ben progettato deve bilanciare questi aspetti garantendo velocità ed efficienza,
senza compromettere la sicurezza o l'affidabilità.

# Evoluzione e Tendenze Future

## Sistemi Operativi Interattivi

Con la crescita della potenza computazionale, i sistemi operativi sono passati da elaborazioni batch a sistemi
**interattivi** e **multitasking**, permettendo l'uso simultaneo di più applicazioni da parte di più utenti.

## Macchine Virtuali

Le **macchine virtuali (VM)** consentono di eseguire più sistemi operativi su un unico hardware, offrendo isolamento e
compatibilità. Questo approccio è utile sia per la retrocompatibilità che per il supporto a diverse piattaforme.

## Sistemi Distribuiti e Cloud

I moderni sistemi operativi devono gestire grandi **data center** e supportare architetture **cloud**. L'uso di
**cluster di server** e l'astrazione dell'hardware migliorano la scalabilità e la resistenza ai guasti.
