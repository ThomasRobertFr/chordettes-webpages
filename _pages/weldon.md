---
layout: page
title: WELDON
order: 49
header-style: particles
parent: projects.md
intro:
    <center> Thibaut Durand, Nicolas Thome, Matthieu Cord </br>
    UPMC Paris 6 - Sorbonne Universités - LIP6 </center>
head-title: WELDON
no-site-title: false
permalink: projects/weldon/
---

## Abstract

We introduce a novel framework for **WEakly supervised Learning of Deep cOnvolutional neural Networks (WELDON)**. Our method is dedicated to automatically **selecting relevant image regions** from weak annotations, e.g. global image labels, and encompasses the following contributions. Firstly, WELDON leverages recent improvements on the Multiple Instance Learning paradigm, i.e. **negative evidence** scoring and **top instance selection**. Secondly, the deep CNN is trained to **optimize Average Precision**, and fine-tuned on the target dataset with efficient computations due to convolutional feature sharing. A thorough experimental validation shows that WELDON outperforms state-of-the-art results on six different datasets.

{: #weldonimg}
![WELDON]({% include url.html url="images/publis/2016_cvpr_weldon.png" %})

## Paper

This paper has been published at _IEEE Conference on Computer Vision and Pattern Recognition_ (CVPR) 2016.

[Paper](../../pdfs/2016_CVPR/Durand_WELDON_CVPR_2016.pdf)

[Supplementary](../../pdfs/2016_CVPR/Durand_WELDON_CVPR_2016_supp.pdf)

[Poster](../../pdfs/2016_CVPR/Durand_WELDON_CVPR_2016_poster.pdf)

Bibtex
```bibtex
@inproceedings{Durand_WELDON_CVPR_2016,
author = {Durand, Thibaut and Thome, Nicolas and Cord, Matthieu},
title = {WELDON: Weakly Supervised Learning of Deep Convolutional Neural Networks},
booktitle = {The IEEE Conference on Computer Vision and Pattern Recognition (CVPR)},
year = {2016}
}
```




## Acknowledgements

This research was supported by a DGA-MRIS scholarship.
