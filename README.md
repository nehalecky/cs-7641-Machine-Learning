# CS 7641: Machine Learning

from [GATech OMSCS](http://www.omscs.gatech.edu/) 

## Notes

- written in Markdown (`*.md`)
- recommend viewing in [StackEdit](https://stackedit.io).

### TOC

- [0.0 Intro: ML is the ROX](https://stackedit.io/viewer#!url=https://raw.githubusercontent.com/nehalecky/CS7641-Machine-Learning/master/notes/0.0_intro_ml_is_rox.md)
- [1.1 SL: Decision Trees](https://stackedit.io/viewer#!url=https://raw.githubusercontent.com/nehalecky/CS7641-Machine-Learning/master/notes/1.1_sl_1_-_decision_trees.md)
- [1.2 SL: Regression and Classification](https://stackedit.io/viewer#!url=https://raw.githubusercontent.com/nehalecky/CS7641-Machine-Learning/master/notes/1.2_sl_2_-_regression_and_classification.md)
- [1.3 SL: Neural Networks](https://stackedit.io/viewer#!url=https://raw.githubusercontent.com/nehalecky/CS7641-Machine-Learning/master/notes/1.3_sl_3_-_neural_networks.md)
- [1.4 SL: Instance-Based Learning](https://stackedit.io/viewer#!url=https://raw.githubusercontent.com/nehalecky/CS7641-Machine-Learning/master/notes/1.4_sl_4_-_instance_base_learning.md)
- [1.5 SL: Ensemble Learning: Bagging and Boosting](https://stackedit.io/viewer#!url=https://raw.githubusercontent.com/nehalecky/CS7641-Machine-Learning/master/notes/1.5_sl_5_-_ensemble_learning_boosting.md)


## Assignments 

- use IPython / Jupyter notebook.
- virtual machine definition can generate all content. 

## Virtual Machine (VM)

All analysis contained in this repo can be reproduced with use of the VM. First, install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) and [Vagrant](http://www.vagrantup.com/downloads) and light all this up quickly, via:

```bash
> git clone git@github.com:nehalecky/cs-7641-Machine-Learning.git
> cd cs-7641-Machine-Learning
> vagrant up
> ./bin/launch-jupyter.sh
```
Then navigate to the [VM-hosted Jupyter session](http://localhost:8009/)—Godspeed! 

## Datasets

### 1. UC Irvine Campus Portfolio Energy Use 

Reference name: **UCI-kW-2014**

The dataset represents one year of 15 minute interval demand data (e.g., kW) for a variety of loads across the UC Irvine campus. Root nodes start at individual buildings and work down through the primary subsystems (lighting, mcc, plug loads, and generation sources)

#### Load Type Hierarchy

##### Building (net metering)

1. **lighting**
    -  outdoor
    -  indoor
2. **mcc** (might be ahu and fans and pumps)
    -  primary (central plant sources)
        - chilled water 
            - pumps 
            - compressor
        - condenser
            - pump 
            - fan
        - hot water 
            - pump
            - boiler
        - thermal storage
        - misc
    -  secondary (on-site building sources / HVAC )
        - pumps
        - fans (ventilation and space conditioning)
            - supply
            - exhaust
3. **plug loads**
4. **generation sources**

### 2. ???


## ML Exercises

Description of the machine learning exercises undertaken in this course.

### 1. Supervised Learning (SL1)

- *Load Type Detection*
A classification attempt to *distinguish* and *detect* varying load types found across the **UCI-kW-2014** dataset.

- *Day Type and Hour Type Detection*
A classification attempt to detect *day types* existing in the dataset, for example:
	- workday, offday, holiday
	- weekday / weekend,
	- day of week


