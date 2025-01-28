## Explore data (HBF-meeting-20250128)

#### Replication of [`shiny-app.R`](https://willemsleegers.shinyapps.io/essay-topic-pretest) in Python using [Streamlit](https://streamlit.io) (A.L. 2025-01-28)


**'explore-data.ipynb' uses: 'prepared-data.csv' and [essay-topics.csv](./essay-topics.csv), the 'streamlit library', the [app.py](.(/app.py) file,<br> 
and the `hbf`conda environment**

Creating the `hbf`conda environment:
```bash
conda create -n hbf python=3.10
conda activate hbf
pip install ipykernel   # for Jupyter Notebook
pip install streamlit pandas numpy plotly
```



Talk by **Prof. Bjørn Sætrevik**

Title: “**A multilab registered report replication of the cognitive dissonance effect**” [[Paper](https://journals.sagepub.com/doi/full/10.1177/25152459231213375)]*<br>

**Abstract:** The concept of “cognitive dissonance” may be the closest we’ve come to a grand unified theory of how minds operate. Despite its central position, the empirical basis for the phenomenon is surprisingly weak. In this talk, I’ll describe how a multi-lab collaboration I’ve been involved it that has attempted to place the theory on a surer footing. We designed a “constructive replication” intended to demonstrate the effect, to create a seminal experimental paradigm for the effect, and to explore the psychological mechanisms behind it. This ambitious project ended up being even more challenging than expected, as it grew to have over 100 authors from 39 countries, around 5,000 participants, was delayed by a pandemic, and had surprising results. I’ll try to disentangle some of the study design choices, experiences from the research process, and the implications of the findings. The project was designed as a “registered report replication” in order to ensure transparency and rigor, to encourage adversarial input and to counteract publication bias. As this research model may be unfamiliar to some in the audience, I’ll also try to explain and advocate for this approach.

Short bio:<br>
Bjørn Sætrevik is a clinical psychologist (2003) with a Ph.D. in cognitive neuroscience (2007). He is a professor of general psychology at the Department of psychosocial science at the University of Bergen and is a member of the Operational psychology research group. Most of Sætrevik’s research is related to applied decision making in safety critical environments. Among his research interests are cognitive control of attention, implicit learning, situation awareness, human performance, perceived risk, public health, teamwork, leadership and communication. Sætrevik involves principles for open and transparent research in his projects and teaching.


*) Adopting to Open Science and Reproducible Research (OSF):
https://osf.io/mgjh8 and https://willemsleegers.shinyapps.io/essay-topic-pretest


**Paper**: D.C. Vaidis et al. (2024) A Multilab Replication of the Induced-Compliance Paradigm of Cognitive Dissonance.<br>**
Advances in Methods and   Practices in Psychological Science January-March 2024, Vol. 7, No. 1,   pp. 1 –26. DOI: 10.1177/25152459231213375
