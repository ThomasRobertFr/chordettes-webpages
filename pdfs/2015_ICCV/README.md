
This is a preliminary version of the code of
MANTRA: Minimum Maximum Latent Structural SVM for Image Classification and Ranking
Thibaut Durand, Nicolas Thome, Matthieu Cord
ICCV 2015


The Jar is compiled with Java 8.
Two solvers are available: Stochastic (Sub)Gradient Descent [SSG] and Non Convex 1 Slack Cutting-Plane [1SCP].
If you use cutting plane solver, you have to install MOSEK (https://mosek.com). An academic free license and trial license are available.

Running command
```java
java -Xmx10g -Xms2g -classpath <PATH_TO_MOSEK>/mosek/7/tools/platform/<PLATFORM>/bin/mosek.jar:target/uber-mantra-0.0.1-SNAPSHOT.jar fr.lip6.durandt.bin.RunMantra <OPTIONS> -train <TRAIN_FILE> -test <TEST_FILE>
```

Run -h option to print the available options. The specific solver options are indicated with [SSG]/[1CSP].

Multi-class
Label is in the range 0 to numClasses-1.

Ranking
Label is 1 for relevant examples and 0 for irrelevant examples.

The input file for train/test is a XML file with the following structure:

<dataset size="[NUMBER_OF_EXAMPLES]">
   <example>
      <imagename>[NAME_OF_EXAMPLE_1]</imagename>
      <output>[LABEL_OF_EXAMPLE_1]</output>
      <featurefile>[FEATURE_FILE_OF_EXAMPLE_1.xml]</featurefile>
   </example>
   <example>
      <imagename>[NAME_OF_EXAMPLE_2]</imagename>
      <output>[LABEL_OF_EXAMPLE_2]</output>
      <featurefile>[FEATURE_FILE_OF_EXAMPLE_2.xml]</featurefile>
  </example>
   ...
</dataset>

You need to replace the [...] with the right value.
NAME_OF_EXAMPLE: is the name of the bag. It is useful to debug.
FEATURE_FILE_OF_EXAMPLE: is the path to the features of the bag. The structure of this XML file is:

<image>
   <name>Easy_Mid_badminton_49</name>
   <imagefile>/Volumes/Eclipse/LIP6/base/UIUC-Sports/event_img/badminton/Easy_Mid_badminton_49.jpg</imagefile>
   <height>768</height>
   <width>1024</width>
   <numberofinstances>4</numberofinstances>
   <instance>
      <index>0</index>
      <x1>1</x1>
      <y1>1</y1>
      <x2>691</x2>
      <y2>922</y2>
      <feature dim="4096">2.248256      0.489836        0.000000        0.000000 ...</feature>
   </instance>
   <instance>
      <index>1</index>
      <x1>1</x1>
      <y1>103</y1>
      <x2>691</x2>
      <y2>1024</y2>
      <feature dim="4096">1.794783      0.979834        0.000000 		0.000000 ...</feature>
  	</instance>
  	...
</image>
