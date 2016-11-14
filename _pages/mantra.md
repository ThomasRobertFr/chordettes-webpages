---
layout: page
title: MANTRA
order: 50
header-style: particles
parent: projects.md
head-title: MANTRA
no-site-title: false
intro:
  <center> Thibaut Durand, Nicolas Thome, Matthieu Cord </br>
  UPMC Paris 6 - Sorbonne Universités - LIP6 </center>

---

## Abstract

We propose a novel **Weakly Supervised Learning (WSL)** framework dedicated to learn discriminative part detectors from images annotated with a global label. Our WSL method encompasses three main contributions. Firstly, we introduce a new **structured output latent variable model, Minimum mAximum lateNt sTRucturAl SVM (MANTRA)**, which prediction relies on a pair of latent variables: h+ (resp. h-) provides positive (resp. negative) evidence for a given output y. Secondly, we instantiate MANTRA for two different visual recognition tasks: **multiclass classification** and **ranking**. For ranking, we propose efficient solutions to exactly solve the inference and the loss-augmented problems. Finally, extensive experiments highlight the relevance of the proposed method: MANTRA outperforms state-of-the art results on five different datasets.


## Paper

This paper has been published at _IEEE International Conference on Computer Vision_ (ICCV) 2015.

[Paper](../pdfs/2015_ICCV/Durand_MANTRA_ICCV_2015.pdf)

[Supplementary](../pdfs/2015_ICCV/Durand_MANTRA_ICCV_2015_supp.pdf)

[Poster](../pdfs/2015_ICCV/Durand_MANTRA_ICCV_2015_poster.pdf)

Bibtex
```bibtex
@inproceedings{Durand_WELDON_CVPR_2016,
author = {Durand, Thibaut and Thome, Nicolas and Cord, Matthieu},
title = {WELDON: Weakly Supervised Learning of Deep Convolutional Neural Networks},
booktitle = {The IEEE Conference on Computer Vision and Pattern Recognition (CVPR)},
year = {2016}
}
```

## Code

[README](../pdfs/2015_ICCV/README.md)

[Jar](../pdfs/2015_ICCV/mantra.jar)

<!-- code matlab visu / github / code java / code scala / code python -->

## Visual Results

We show the response maps and the predicted regions for differents images of UIUC Sports dataset. The red (resp. blue) box is the region with the maximum (resp. minimum) score. The first column shows the results for the ground truth model, whereas the other columns show the results for wrong class.

{: #mantravisus}
![Illustration de WELDON]({% include url.html url="images/projects/mantra/000375_sailing_bbox_.png" %} ) | ![Illustration de WELDON]({% include url.html url="images/projects/mantra/000375_bad_bbox_.png" %}) | ![Illustration de WELDON]({% include url.html url="images/projects/mantra/000375_bocce_bbox_.png" %}) | ![Illustration de WELDON]({% include url.html url="images/projects/mantra/000375_rowing_bbox_.png" %})
:---: | :---: | :---: | :---:
sailing     | badminton     | bocce     | rowing
![Illustration de WELDON]({% include url.html url="images/projects/mantra/000121_croquet_bbox_.png" %} ) | ![Illustration de WELDON]({% include url.html url="images/projects/mantra/000121_bad_bbox_.png" %}) | ![Illustration de WELDON]({% include url.html url="images/projects/mantra/000121_bocce_bbox_.png" %}) | ![Illustration de WELDON]({% include url.html url="images/projects/mantra/000121_snow_bbox_.png" %})
croquet     | badminton     | bocce     | snowboard
![Illustration de WELDON]({% include url.html url="images/projects/mantra/000183_polo_bbox_.png" %} ) | ![Illustration de WELDON]({% include url.html url="images/projects/mantra/000183_bad_bbox_.png" %}) | ![Illustration de WELDON]({% include url.html url="images/projects/mantra/000183_croquet_bbox_.png" %}) | ![Illustration de WELDON]({% include url.html url="images/projects/mantra/000183_rowing_bbox_.png" %})
polo        | badminton	    | croquet   |rowing
![Illustration de WELDON]({% include url.html url="images/projects/mantra/000357_rowing_bbox_.png" %} ) | ![Illustration de WELDON]({% include url.html url="images/projects/mantra/000357_bad_bbox_.png" %}) | ![Illustration de WELDON]({% include url.html url="images/projects/mantra/000357_croquet_bbox_.png" %}) | ![Illustration de WELDON]({% include url.html url="images/projects/mantra/000357_sailing_bbox_.png" %})
rowing      | badminton	    | croquet   | sailing
![Illustration de WELDON]({% include url.html url="images/projects/mantra/000427_snow_bbox_.png" %} ) | ![Illustration de WELDON]({% include url.html url="images/projects/mantra/000427_bocce_bbox_.png" %}) | ![Illustration de WELDON]({% include url.html url="images/projects/mantra/000427_croquet_bbox_.png" %}) | ![Illustration de WELDON]({% include url.html url="images/projects/mantra/000427_polo_bbox_.png" %})
snowboard   | bocce         | croquet   | polo



## Acknowledgements

This research was supported by a DGA-MRIS scholarship.
