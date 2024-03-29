# SciBookNeue

A LaTeX class for better, modern, and dual-format math and science textbooks. 

Most math/physic/science textbooks in my upper-division courses have clearly been typeset in `LaTeX`, and it shows. 
The goal of this project is to produce a ready-to-use `LaTeX` document class that vastly improves upon the default output
and provide support for easily creating both screen and print PDFs simultaneously

## The main problems

LaTeX output is by default quite ugly and needs a revamp. 
Textbook content should adapt to non-print formats to meet the needs of digital textbook users.

## Motivation

Latex, while having many strengths, has (in my opinion) an awful default formatting system.
In my opinion:
  - The default typeface is not well suited to print or modern computer screens. 
  - Justification and margins are weird.
  - Captioning and figure/table/illustration/graph placement is non-intuitive and can easily break the flow of the main content


Furthermore, most of the textbooks in my upper division math and physics courses are created with `LaTeX`,
and most students purchase or are given a digital copy as a PDF as a green, cheap, easily annotatable and searchable alternative to the more 'standard', expensive printed versions.

The challenge then is to create a `LaTeX` class that scientific writes already familiar with `LaTeX` can use to create cleaner,
better-looking, textbooks for both screens and print, while still being able to take advantage of the many strengths `LaTeX` offers.

It is also my belief that authors should need only worry (mostly) about cotnent and less about the design of their book.
Granted, many authors in the sciences enjoy or have a desire to tinker with formatting and layout, but a better option should be made available
for those who are not as enthusiastic about these things. 

From an interview with [Leslie Lamport](https://lamport.azurewebsites.net/pubs/lamport-latex-interview.pdf):
> _Three `LaTeX` mistakes that people should stop making?_
> 
> 1. Worrying too much about formatting and not enough about content. 2. Worrying too much about formatting and not enough about content. 3. Worrying too much about formatting and not enough about content.
>

## Design Goals

 - Simultaneously allow for outputs formatted for screens and for print. 
 - Take advantage `LaTeX`'s robust hierarchical structuring and intra-document referencing to make on-screen navigation easier. 
 - Produce clean, easy-to-read, PDFs

#### Helpful links:
[https://tex.stackexchange.com/questions/59244/theorem-name-numbering-in-margin]
