Figures and Images
==================
 
Remarks on reST
---------------

The scale option for ``:image:`` and ``:figure:`` seems to require the
the python Pillow package according to

-  https://docutils.sourceforge.io/docs/ref/rst/directives.html#image

-  https://docutils.sourceforge.io/docs/ref/rst/directives.html#figure

When using figures in tables, the ``:width:`` seems to be a better choice
that avoids distortion. Read up on``figwidth`` and ``width``.

The default figure and image target option seems to display the full
image.

You can add caption and legend text to a figure caption. The legend can
even include a paragraph and a table, as the docutils documentation
example shows, or a list. 

When image or figures have a target, the path
must be specified as ``../_images/blah-target.jpg``, which is sort of a
hassle.

Ideas:
------

- Maybe an ordered list or single-column table of figures with captions, targets, a figclass, a width (or figwidth) and n explicita taget or the default self-target.
  The alginment of the figures can be either center or left.
- The pages of bilds will include a top-level header and section headers for--what--the person's name likely and the transcription.
- We need some place for transcribing the colun headers or using an include to repeated include it.s
 
