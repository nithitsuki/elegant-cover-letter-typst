#let cover-letter(
  name: "",
  address: (),
  contact: (),
  date: "",
  recipient: (),
  salutation: "To whom it may concern,",
  closing: "Sincerely,",
  signature: none,
  enclosures: none,
  body 
) = {
  set document(author: name, title: "Cover Letter")
  set page(margin: (x: 1in, y: 0.7in))
  set text(font: ("Linux Libertine", "Times New Roman"), size: 11pt, lang: "en")
  
  // Header
  align(center)[
    #text(size: 16pt, weight: "bold", top-edge: "ascender", bottom-edge: "descender")[#name]
    #v(-0.15in)
    #line(length: 100%, stroke: 0.8pt)
    #if address.len() > 0 [
        #address.join("\n") \
    ]
    #if contact.len() > 0 [
      #contact.join(" or ")
    ]
  ]
  
  v(3em)
  
  // Date
  align(left)[#date]
  
  v(2em)
  
  // Recipient
  align(left)[
    #recipient.join("\n")
  ]
  
  v(1em)
  
  // Salutation
  align(left)[#salutation]
  
  v(1em)
  
  // Body
  set par(justify: true, leading: 0.65em, first-line-indent: 0pt)
  show par: set block(spacing: 1.2em)
  
  body
  
  v(2em)
  
  // Closing
  align(left)[
    #closing \
    #v(-0.33em)
    #if signature != none [
      #signature
    ] else [
      #v(3em)
    ]
    #name
    
    #if enclosures != none [
      #v(1em)
      encl: #enclosures
    ]
  ]
}
