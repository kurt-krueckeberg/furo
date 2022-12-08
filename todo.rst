Figures and Images
==================

.. todo:: clean up buil errors.
 
Remarks on reST
---------------

The ``:scale:`` option for ``:image:`` and ``:figure:`` seem to require the the python Pillow package according to

To apply ``:scale:`` or ``:with:`` options to the image within an figure (instead of to the figure itself), you must ``image`` for
as the ``figclass`` and ``figwidth`` like this:

.. code-block:: rst

   .. figure:: /images/img1.jpg         
      :figclass: image
      :class: with-border
      :figwidth: image 
      :scale: 15 %
                                                              
      Caption for image  
                                                              
      Legend where I will put description (or transcription).

The default figure ``target:`` option is to display the full image. 

You can add captions and legends to a figure. The legend can even include a paragraph and a table, as the 
docutils documentation example shows, or a list, but I can't think of a use for this flexibilty. 

Plans
-----

::

 TODO: Remove the find command ansd instead use code entirely to iterate file
 in /t folder and do preg_match or preg_replaced . Also change the format of the .rst files in /p
 to be whatever makes the php code easiest.

Generate Pages
~~~~~~~~~~~~~~

Use an input spec file like a .toml file that will generate the .rst pages. 
 
