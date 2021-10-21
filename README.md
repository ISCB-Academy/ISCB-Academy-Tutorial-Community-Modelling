#### ISCB-Academy-Tutorial-Community-Modelling

# Metabolic modelling of microbial interactions in microbiomes

The recent years have seen the emergence of the microbiomes as important axes of human health and disease<sup>1-4</sup>. Microbial communities abound in various regions of the human body, notably the gut, skin and the oral cavity. Microbial communities have been used in the past for food fermentations<sup>5</sup> and wastewater treatments<sup>6</sup>. Recently, consortia of microbes have also gained traction in the bioprocess industry for industrial fermentations<sup>7-9</sup>. Many algorithms and tools have been developed to study microbial communities, particularly the metabolic interactions that drive and sustain these microbial communities<sup>10-13</sup>. 

In this tutorial, we seek to provide a brief overview of the key modelling paradigms that have been used to study microbiomes.
1. Graph-based modelling
2. Constraint-based modelling

## Graph-based modelling

This involves construction of genome-scale metabolic networks (GSMN) consisting of thousands of reactions and metabolites, which capture vital metabolic pathways such as the biosynthesis of amino acids and lipids, ATP synthesis, as well as transport of molecules inside the cells which allows us to model microbial interactions as part of a complex graph capturing the exchange of several metabolites between the constituent organisms, and consequently, shed light on the nature of the interactions between the organisms<sup>14</sup>. This approach provides qualitative insights by considering the topology of the metabolic networks. Here, the metabolic networks are analysed for their ability to produce metabolites. The interdependencies between the organisms are defined based on the metabolites that one organism provides the other. MetQuest<sup>14</sup>, NetSeed<sup>15</sup>, NetCmpt<sup>16</sup> are some of the graph-based modelling tools. This tutorial will introduce you to MetQuest and its applications.

## Constraint-based modelling

Constraint-based modelling attempts to model microbial metabolic networks in terms of the fluxes of various constituent reactions. In simpler terms, these are same network of metabolic reactions but with defined reaction stoichiometries and flux values for every reactions. These constraint-based metabolic models will allow us to study different types of interactions present in a microbial community by determining the flux distributions in the metabolic networks. These techniques solve for an objective function by imposing different constraints and derive the fluxes of the reactions through metabolic exchanges which is more similar to solving a constraint-based optimization problem where the objective is high biomass (maximum flux through biomass reaction). Community flux balance analysis (cFBA), OptCom and SMETANA are some of the constraint-based modelling tools. This tutorial will focus on the application community flux balance analysis (cFBA).

## Pre-requisites

### Jupyter Notebook with Python 3.6 or above
If you do not have Python 3.6 or above, then follow the below instructions to download it. If you have Python >= 3.6 and want to download Jupyter Notebook alone separately then refer this [link](https://jupyter.org/install.html).
#### Anaconda for Windows
Anaconda is a Python distribution with a lot of in-built open-source packages and libraries and it is a efficient package and environment manager.
* Anaconda can be downloaded from [Download link](https://www.anaconda.com/products/individual).
* Run the setup.
* Note the installation location and press Next.
* We can choose whether to add Anaconda to the PATH environment variable or not. Its advised not to add Anaconda to the PATH environment variable, since this can interfere with other software. Instead, use Anaconda software by opening Anaconda Navigator or the Anaconda Prompt from the Start Menu.
* You can register Anaconda as your default Python based on your requirement.
* Click Install and finish the process.
* You might have to add the paths ```anaconda3/Library/bin``` and ```anaconda3/Scripts``` to the PATH of your environment of system variables if not present already.
* After all this is done, you can open Anaconda prompt (anaconda3) and type the command ```jupyter notebook``` to launch Jupyter.

**Source** (For more detailed instructions): refer [Installation](https://docs.anaconda.com/anaconda/install/windows/).

If you are a **macOS or Linux** user. The installation process is pretty much the same. Refer this [link](https://docs.anaconda.com/anaconda/install/index.html).

### MATLAB
Installing MATLAB - instructions

* 

### CobraToolBox for MATLAB
* Download CobraToolBox from [download link](https://drive.google.com/file/d/12N5sIjHpjPW8GUjanTKlT-W_WCc0zYql/view?usp=sharing).
* This is a Google Drive link. Download the zip file.
* Unzip it.
* Add the path to your installed CobraToolBox folder to MATLAB using the command ```addpath(path to COBRA)``` in the MATLAB console.
* Then run the command ```initCobraToolbox``` to initialize it. **Note**: This command has to be run everytime after restarting MATLAB.

**Note**: This is a slightly old version. The latest version of CobraToolBox is not compatible with the models used in this exercise, so kindly download this.

## How to use this repository

* Make sure you have all the pre-requisites.
* We recommend you to create a new folder ```anaconda3/Scripts/iscb-tutorial-metabolic-modelling``` and clone this repository there.
* For **Graph-based metabolic modelling** exercise, you can open Jupyter Notebook using Anaconda, then the ipython notebook file (Graph-based metabolic modelling.ipynb) can be loaded and run.
* For **Constraint-based metabolic modelling** exercise;
  1. Add the ```path_to/anaconda3/Scripts/iscb-tutorial-metabolic-modelling``` folder to MATLAB path using the ```addpath(path)``` command in the MATLAB console.
  2. Run the command ```edit Constraint_based_metabolic_modelling.m``` to open the MATLAB live script for execution.

## Resources

* [BiGG](http://bigg.ucsd.edu/), [AGORA](https://www.vmh.life/#home)
* [COBRA ToolBox](https://opencobra.github.io/cobratoolbox/stable/)
* [MetQuest](https://github.com/RamanLab/metquest)

## Reading materials
* [Systems-Level Modelling of Microbial Communities](https://doi.org/10.1201/9780429487484)
* [An Introduction to Computational Systems Biology](https://doi.org/10.1201/9780429486951)
### References 

1.	Clemente, J. C., Ursell, L. K., Parfrey, L. W. & Knight, R. The impact of the gut microbiota on human health: An integrative view. Cell 148, 1258–1270 (2012). 

2.	Ley, R. E., Turnbaugh, P. J., Klein, S. & Gordon, J. I. Human gut microbes associated with obesity. Nature 444, 1022–1023 (2006). 

3.	O’Hara, A. M. & Shanahan, F. The gut flora as a forgotten organ. EMBO Rep. 7, 688–693 (2006). 

4.	Chng, K. R. et al. Metagenome-wide association analysis identifies microbial determinants of post-antibiotic ecological recovery in the gut. Nat. Ecol. Evol. (2020). doi:10.1038/s41559-020-1236-0 

5.	Smid, E. J. & Lacroix, C. Microbe–microbe interactions in mixed culture food fermentations. Curr. Opin. Biotechnol. 24, 148–154 (2013). 

6.	Angenent, L. T., Karim, K., Al-Dahhan, M. H., Wrenn, B. A. & Domíguez-Espinosa, R. Production of bioenergy and biochemicals from industrial and agricultural wastewater. Trends Biotechnol. 22, 477–85 (2004). 

7.	Lynd, L. R., van Zyl, W. H., McBride, J. E. & Laser, M. Consolidated bioprocessing of cellulosic biomass: an update. Curr. Opin. Biotechnol. 16, 577–583 (2005). 

8.	Ma, Q. et al. Integrated Proteomic and Metabolomic Analysis of an Artificial Microbial Community for Two-Step Production of Vitamin C. PLoS One 6, e26108 (2011). 

9.	Du, J., Zhou, J., Xue, J., Song, H. & Yuan, Y. Metabolomic profiling elucidates community dynamics of the Ketogulonicigenium vulgare-Bacillus megaterium consortium. Metabolomics 8, 960–973 (2012). 

10.	Ravikrishnan, A. & Raman, K. Systems-Level Modelling of Microbial Communities. Systems-Level Modelling of Microbial Communities (CRC Press, 2018).  

11.	Bosi, E., Bacci, G., Mengoni, A. & Fondi, M. Perspectives and Challenges in Microbial Communities Metabolic Modeling. Front. Genet. 8, 1–9 (2017). 

12.	Henry, C. S. et al. Microbial Community Metabolic Modeling: A Community Data-Driven Network Reconstruction. J. Cell. Physiol. 231, 2339–2345 (2016). 

13.	Biggs, M. B., Medlock, G. L., Kolling, G. L. & Papin, J. a. Metabolic network modeling of microbial communities. Wiley Interdiscip. Rev. Syst. Biol. Med. 7, 317–334 (2015). 

14.	Ravikrishnan, A., Nasre, M. & Raman, K. Enumerating all possible biosynthetic pathways in metabolic networks. Sci. Rep. 8, 9932 (2018).

15.	Carr, R., & Borenstein, E. (2012). NetSeed: a network-based reverse-ecology tool for calculating the metabolic interface of an organism with its environment. Bioinformatics, 28(5), 734-735.

16.	Kreimer, A., Doron-Faigenboim, A., Borenstein, E., & Freilich, S. (2012). NetCmpt: a network-based tool for calculating the metabolic competition between bacterial species. Bioinformatics, 28(16), 2195-2197.
