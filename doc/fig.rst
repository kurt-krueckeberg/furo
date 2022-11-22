Figure Test
===========

.. figure:: p.jpg
   :scale: 50 %

   This is the caption of the figure (a simple paragraph).

   The legend consists of all elements after the caption.  In this
   case, the legend consists of this paragraph and the following
   table:

   +-------------------------------------+-----------------------+
   | Symbol                              | Meaning               |
   +=====================================+=======================+
   | .. image:: bild11.jpg               | test using archion    |
   |    :target: ../_images/bild11.jpg   |                       |
   +-------------------------------------+-----------------------+
   | .. image:: t2.jpg                   | test using archion    |
   +-------------------------------------+-----------------------+

Below is a figure whose caption includes a list of inages. This there is a figure, a pciture,
followed by a list of pictures.

.. figure:: p.jpg
   :scale: 50 %
   :align: left

   This is the caption of the figure, a paragrah plus unordered list.

   The legend consists of all elements after the caption.  In this
   case, the legend consists of this paragraph and the following
   unordered list:

   * Image 11 from church book

   .. image:: bild11.jpg         
      :target: ../_images/bild11.jpg

   * Image 5-1, from church book

     .. image:: b5.jpg         
        :target: ../_images/b5.jpg

Below is a list table that contains figures that could have captions, scaled and have tagets.

.. list-table:: Title
   :header-rows: 1

   * - Heading row 1, column 1
   * -
       .. image:: bild1.jpg         
          :target: ../_images/bild1.jpg

   * - Row 2, column 1

Below is a list table that contains figures that could have captions, scaled and have tagets.

.. list-table:: Title
   :header-rows: 1

   * - Heading row 1, column 1
   * -
       .. figure:: bild1.jpg         
          :width: 50 %
          :target: ../_images/bild1.jpg
          :figclass: fig-class

   * -   .. figure:: bild11.jpg         
          :scale: 50 %
          :target: ../_images/b5.jpg
          :figclass: fig-class


