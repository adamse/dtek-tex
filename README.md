Datateknologsektionens LaTeX-klasser
====================================

## `dtek` class

Inkluderar sektionens logotyp, `\title` och `\date` i sidhuvudet.

### Options

Väljs när man laddar klassen

    \documentclass[options]{dtek}

* `includeaddress`: inkluderar sektionens fysiska och digitala adresser i sidfoten

### Kommandon

* `\maketitle`: skriver ut titel och datum, givna av `\title{}` och `\date{}`.
* `\makesign{Namn}`: rad för signatur med "Namn" under.


## `dtekprotokoll` class

Utöver det som nämns ovan inkluderar denna klassen `\motesnummer` och `\verksamhetsar` i sidhuvudet samt plats för signaturer i sidfoten.

### Options

* `twojust`: används för protokoll som kräver två justerare.

### `funktionarer`

Environment som används för att skapa en närvarolista.

    \begin{funktionarer}
      \funktionar[sekr]{Sekreterare}{Adam Sandberg Eriksson}{saadam}
    \end{funktionarer}

### Kommandon

* `\plats`, `\motesnummer` och `\verksamhetsar`: måste anges.

* `\funktionar[snabbkommando]{funktion}{namn}{email}`: Används bara med `funktionarer` ovan. Om man tar med `[snabbkommande]` skapas `\snabbkommando` som expanderar till `namn`.

* `\makesigns{sekreterare}{ordförande}[justerare1][justerare2]`: I slutet av protokollet, för signaturrader.
