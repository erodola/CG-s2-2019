## Computer Graphics

Materiale del corso

### News

- **14/03/2019:** La **prova in itinere** si terrà Giovedì 11 Aprile (orario e aula della lezione).

### Logistics

**Docente:** Prof. Emanuele Rodolà

**Quando:** Mercoledì 10:30-13:00 e Giovedì 10:30-13:00 ([orario ufficiale](https://www.studiareinformatica.uniroma1.it/laurea/orario-lezioni))

**Dove:** Aula 1 - Aule L di Ingegneria, via del Castro Laurenziano 7a

**Ricevimento:** Per appuntamento scrivendo un'email a _cognome_senza_accento@di.uniroma1.it_

### Pre-requisiti

Fondamenti di programmazione; non è richiesta la conoscenza di un linguaggio specifico, ma a lezione verranno mostrati esempi in  **Matlab**. Basi di calcolo ed algebra lineare sono anche utili, ma gli strumenti principali verranno comunque rivisti in lezioni specifiche.

### Syllabus

Il corso copre argomenti di elaborazione di immagini e modellazione 3D, con cenni a tecniche di visualizzazione e di rendering. Gli argomenti del corso verranno introdotti da zero partendo dai concetti matematici di base fino ad argomenti più avanzati, inclusi risultati recenti pubblicati in conferenze di Computer Graphics. Sono previsti interventi e seminari da parte di esperti del settore. Il corso viene sviluppato in parallelo sia dal punto di vista teorico che pratico, con frequenti sessioni di programmazione live in aula.

### Libri di testo e materiale

Data la natura eterogenea del corso, non è previsto l'utilizzo di un testo unico. Il materiale specifico verrà fornito e indicato durante le lezioni.

### Esame

L'esame consiste in una prova in itinere e da una prova finale; entrambe le prove sono scritte. Ulteriori dettagli verranno definiti e comunicati durante il corso.

### Lezioni

**Data** | **Argomento** | **Materiale** | **Codice e dati**
------------ | ------------- | ------------ | ------------
| | |
Mer 27 Feb | Introduction | [slides](https://github.com/erodola/CG-s2-2019/raw/master/01_intro/01-intro.pdf) | 
| | |
Gio 28 Feb | Shape and image representation | [slides](https://github.com/erodola/CG-s2-2019/raw/master/02_repr/02-repr.pdf) | [cat0.off](https://github.com/erodola/CG-s2-2019/raw/master/02_repr/code/cat0.off) ; [load_off.m](https://github.com/erodola/CG-s2-2019/raw/master/02_repr/code/load_off.m)
| | |
Mer 06 Mar | Linear algebra I | [slides](https://github.com/erodola/CG-s2-2019/raw/master/03_linalg/03-linalg.pdf) | [lena.png](https://github.com/erodola/CG-s2-2019/raw/master/03_linalg/lena.png) ; [demo.m](https://github.com/erodola/CG-s2-2019/raw/master/03_linalg/demo.m)
| | |
Gio 07 Mar | Linear algebra II | [slides](https://github.com/erodola/CG-s2-2019/raw/master/04_linalg2/04-linalg2.pdf) | [baboon.png](https://github.com/erodola/CG-s2-2019/raw/master/04_linalg2/baboon.png)
| | |
Mer 13 Mar | Visualization I | [slides](https://github.com/erodola/CG-s2-2019/raw/master/05_viz/05-viz.pdf) | [tr_reg_000.off](https://github.com/erodola/CG-s2-2019/raw/master/05_viz/code/tr_reg_000.off) ; [demo.m](https://github.com/erodola/CG-s2-2019/raw/master/05_viz/code/demo.m) ; [spdiag.m](https://github.com/erodola/CG-s2-2019/raw/master/05_viz/code/spdiag.m)
| | |
Gio 14 Mar | **Industry Seminar: Matteo Sala** | | [TOSCA dataset](http://tosca.cs.technion.ac.il/data/toscahires-mat.zip) ; [FAUST dataset](http://faust.is.tue.mpg.de/) ; [The VES Handbook of Visual Effects](http://www.varmstudio.com/stuff/miisu/VES.pdf) ; [alien.off](https://github.com/erodola/CG-s2-2019/raw/master/alien.zip)
| | |
Mer 20 Mar | Proximity | [slides](https://github.com/erodola/CG-s2-2019/raw/master/06_prox/06-prox.pdf) | [ralph.png](https://github.com/erodola/CG-s2-2019/raw/master/06_prox/code/ralph.png) ; [p5.png](https://github.com/erodola/CG-s2-2019/raw/master/06_prox/code/p5.png) ; [p5_projected.png](https://github.com/erodola/CG-s2-2019/raw/master/06_prox/code/p5_projected.png) ; [demo_adj.mlx](https://github.com/erodola/CG-s2-2019/raw/master/06_prox/code/demo_adj.mlx) ; [demo_bwr.mlx](https://github.com/erodola/CG-s2-2019/raw/master/06_prox/code/demo_bwr.mlx) ; [demo_pcl.mlx](https://github.com/erodola/CG-s2-2019/raw/master/06_prox/code/demo_pcl.mlx) ; [demo_im_dist.mlx](https://github.com/erodola/CG-s2-2019/raw/master/06_prox/code/demo_im_dist.mlx)
| | |
Gio 21 Mar | Metric spaces | [slides](https://github.com/erodola/CG-s2-2019/raw/master/07_metric/07-metric.pdf) | [demo_lp.mlx](https://github.com/erodola/CG-s2-2019/raw/master/07_metric/code/demo_lp.mlx) ; [demo_voronoi.mlx](https://github.com/erodola/CG-s2-2019/raw/master/07_metric/code/demo_voronoi.mlx) ; [save_as_off.m](https://github.com/erodola/CG-s2-2019/raw/master/07_metric/code/save_as_off.m) ; [load_ply.m](https://github.com/erodola/CG-s2-2019/raw/master/07_metric/code/load_ply.m) ; [ply_read.m](https://github.com/erodola/CG-s2-2019/raw/master/07_metric/code/ply_read.m)
| | |
Mer 27 Mar | Local coordinates | [slides](https://github.com/erodola/CG-s2-2019/raw/master/08_coords/08-coords.pdf) | [calc_adj_matrix.m](https://github.com/erodola/CG-s2-2019/raw/master/08_coords/code/calc_adj_matrix.m) ; [calc_mean_value_coords.m](https://github.com/erodola/CG-s2-2019/raw/master/08_coords/code/calc_mean_value_coords.m) ; [calc_onering.m](https://github.com/erodola/CG-s2-2019/raw/master/08_coords/code/calc_onering.m) ; [create_grid_topology.m](https://github.com/erodola/CG-s2-2019/raw/master/08_coords/code/create_grid_topology.m) ; [interactive_ls.m](https://github.com/erodola/CG-s2-2019/raw/master/08_coords/code/interactive_ls.m) ; [interactive_mean.m](https://github.com/erodola/CG-s2-2019/raw/master/08_coords/code/interactive_mean.m) ; [test_ls_interactive.m](https://github.com/erodola/CG-s2-2019/raw/master/08_coords/code/test_ls_interactive.m) ; [test_mean.m](https://github.com/erodola/CG-s2-2019/raw/master/08_coords/code/test_mean.m)
| | |
Gio 28 Mar | Visualization II | [slides] |
| | |
