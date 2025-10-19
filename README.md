# 🧠 Bilde-segmentering med DINOv3 og logistisk regresjon

Dette prosjektet er en del av arbeidskravet i **Anvendt maskinlæring** ved Viken Fagskole.  
Formålet er å forstå hvordan en forhåndstrent nevralt nettverk (DINOv3 fra Meta AI) kan brukes til **bilde-segmentering** uten å trene et stort nettverk fra bunnen av.

---

## 🎯 Mål
1. Bruke DINOv3 (ViT-S/16) som **feature extractor** for å hente ut egenskaper fra bilder.  
2. Trene en **logistisk regresjonsmodell (clf)** på toppen av disse feature-vektorene.  
3. Bruke modellen til å **segmentere nye bilder** og vise resultatene.  
4. (Valgfritt) teste modellen på en **video** i sanntid for å demonstrere generalisering.

---

## 📁 Mappestruktur
```
Segmentering/
│
├── Data/
│   ├── images/        → Inneholder treningsbilder
│   └── labels/        → Inneholder maskebilder (labels)
│
├── notebooks/
│    └── foreground_segmentation.ipynb
├── tools/
│    └── click_n_mask.py
│    └── sam_vit_b_01ec64.pth
├── Videoer/           → Valgfri mappe for å vise video med AI-segmentering
│    └── test.mp4
├── dinov3_vits16.pth  → Forhåndstrente vekter (lastes ned automatisk om den mangler)
│
├── README.md
└── requirements.txt
```

---

## ⚙️ Installasjon

### 1. Opprett og aktiver miljø (valgfritt)
```bash
python -m venv venv
venv\Scripts\activate
```

### 2. Installer nødvendige pakker
```bash
pip install -r requirements.txt
```

### 3. Start Jupyter Notebook
```bash
jupyter notebook
```

---

## 🧩 Hoveddeler av oppgaven

### **1. Laste inn bilder og masker**
Bilder hentes fra Data/images/, og tilhørende masker fra Data/labels/.
Hvert bilde har en binær maske hvor hvitt representerer verktøy og svart bakgrunn.

Maskene er laget med vårt eget program click_n_mask.py, som bruker Segment Anything (SAM).
Brukeren klikker på verktøyet (positive punkter) og bakgrunnen (negative punkter), og programmet genererer en ferdig maske.

### **2. Feature-ekstraksjon med DINOv3**
Vi bruker DINOv3 (Vision Transformer – ViT-S/16) til å hente ut representasjoner av bildene.
Disse representasjonene fungerer som feature-vektorer for hvert bildepunkt og brukes som input til den logistiske modellen.

Modellfilen dinov3_vits16.pth inneholder de forhåndstrente vektene og lastes inn direkte i notebooken.

### **3. Trening av logistisk regresjon**
Feature-vektorene fra DINOv3 brukes til å trene en logistisk regresjon fra scikit-learn.
Modellen lærer å skille mellom forgrunn (verktøy) og bakgrunn basert på maskene.

Når treningen er ferdig, kan modellen brukes til å generere en segmentert maske for de samme bildene som ble brukt under trening.

### **4. Evaluering og visualisering**
Notebooken viser resultatene i form av bilder:

Originalbilde

Forgrunnssannsynlighet

Predikert binær maske

Dette gjør det mulig å se hvordan modellen lærer å markere verktøyet i hvert bilde. 

### **5. (Valgfritt) Video-demo**
Koden kan også vise hvordan modellen fungerer på en video i sanntid (eller på en lagret videofil).
Dette er ment som en visuell demonstrasjon av segmentering, ikke som en test eller måling av nøyaktighet.

---

## 📦 Nødvendige filer
| Fil                    | Beskrivelse                           |
| ---------------------- | ------------------------------------- |
| `dinov3_vits16.pth`    | Forhåndstrente vekter fra Meta AI     |
| `Data/images/`         | Treningsbilder                        |
| `Data/labels/`         | Maskebilder laget med click_n_mask.py |
| `click_n_mask.py`      | Program for maskegenerering           |
| `sam_vit_b_01ec64.pth` | Modellfil brukt av SAM                |
| `Videoer/`             | Valgfri mappe for testvideoer         |

---

## ▶️ Hvordan kjøre prosjektet
1. Åpne notebooken foreground_segmentation.ipynb.

2. Kjør cellene i rekkefølge:

   -Last bilder og masker

   -Kjør DINOv3-feature-ekstraksjon

   -Tren logistisk regresjon

   -Segmenter og vis resultatene

3. (Valgfritt) Kjør video-delen for å vise sanntidssegmentering.

---

## 💡 Forklaring av DINOv3-delen
DINOv3 (Self-Supervised Vision Transformer) er trent av Meta AI uten manuelle labels.
Den lærer å forstå visuelle mønstre ved å sammenligne ulike utsnitt av samme bilde.
Vi bruker denne modellen til å hente meningsfulle features som kan brukes videre i klassifikasjon eller segmentering

---

## 👨‍🏫 Om prosjektet
- **Fag:** Anvendt Maskinlæring  
- **Skole:** Viken Fagskole  
- **Student:** Ahmad Rezae  
- **År:** 2025  
- **Veileder:** Shahin Kamil Ostadahmadi 

---

> 📌 Merk: Notebooken (`foreground_segmentation.ipynb`) er større enn 20 MB, og GitHub kan derfor ikke vise den direkte i nettleseren.  
> For å se innholdet, last ned repoet som ZIP og åpne notebooken lokalt i Jupyter Notebook.


## 📜 Kilder
- Meta AI Research – [DINOv3: Self-supervised learning with Vision Transformers](https://github.com/facebookresearch/dinov3)  
- Scikit-Learn dokumentasjon: [https://scikit-learn.org](https://scikit-learn.org)  
- PyTorch dokumentasjon: [https://pytorch.org](https://pytorch.org)

---

🧩 *Prosjektet viser hvordan man kan kombinere ferdigtrente nevrale nettverk med enkle klassifikasjonsmodeller for å løse komplekse oppgaver som bilde-segmentering på en effektiv måte.*
