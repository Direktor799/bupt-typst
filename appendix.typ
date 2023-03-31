#import "template.typ": *

#let Appendix(
  bibliographyFile: none,
  
  body
) = {
  set heading(numbering: none, outlined: false)
  show heading: it => locate(loc => {
    set par(first-line-indent: 0em)
    
    let levels = counter(heading).at(loc)

    if it.level == 1 {
      align(center)[
        #text(font: FONTSET.at("Hei"), size: 16pt, it.body)
      ]
    } else if it.level == 2 {
      text(size: 14pt, it.body)
    }
  })

  // 参考文献
  if bibliographyFile != none {
    pagebreak()
    [= 参考文献]
    
    bibliography(bibliographyFile, title: none)
    show bibliography: it => {
      set text(font: (FONTSET.at("English"), FONTSET.at("Song")), size: 10.5pt)
    }
  }

  body
}