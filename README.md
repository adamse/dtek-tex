Datateknologsektionens LaTeX-klass
==================================

Class options
-------------

### `protokoll`

* Används för protokoll
* Specificera `\title`, `\date`, `\start` (mötestid), `\plats`, `\motesnummer` och `\verksamhetsar`.

Inkluderar plats för signaturer i sidfoten och mötesnummer och verksamhetsår i sidhuvudet.

### `twojust`

Används tillsammans med `protokoll` och ger plats åt två justeringssignaturer.

### `includeaddress`

Inkluderar Datateknologsektionens address i sidfoten.

Kommandon och environments
--------------------------

### `\title`

Specificerar dokumentets titel. Syns i sidhuvudet och om `\maketitle` används.

### `\date`

För protokoll specificerar `\date` mötesdatum. För andra dokument är det ändrings/publiceringsdatum.

### `\plats`, `\motesnummer` och `\verksamhetsar`

Används för protkoll.

### `\maketitle`

Skapar skriver ut titel och datum för dokumentet. För `protokoll` inkluderas
även \plats och \start i titeln.

### `\funktionar`

Specificerar en funktionär som visas i närvarolistan för ett `protokoll`, används tillsammans med `funktionarer` nedan.

Syntax: `\funktionar[snabbkommando]{funktion}{namn}{email}`

Om man specificerar det optionella argumentet "snabbkommando" kommer det att skapas ett `\snabbkommando` som expander till `namn`.

### `funktionarer`

En "environment", efter `\maketitle`. Används för att skapa en närvarolista.

Syntax:

    \begin{funktionarer}
      \funktionar[sekr]{Sekreterare}{Adam Sandberg Eriksson}{saadam}
    \end{funktionarer}


