#import "@preview/ilm:1.4.2": *

#set text(lang: "en")

#show: ilm.with(
  title: [The Great Zoe Hyrien],
  author: "Zoe Hyrien",
  date: datetime(year: 2024, month: 03, day: 19),
  abstract: [
    "Zoe Hyrien — the GREAT French — is a storyteller whose life stretches from the rain-scented pines of Seattle to the busy streets of New York and the quiet lanes of France. She carries three cities inside her: a Pacific dawn, an East Coast rush, and a French afternoon that lingers like warm bread. This short piece traces a day in her life, where memory and place fold together into the kind of small miracles that feel like home."
  ],
  preface: [
    #align(center + horizon)[
      Celebrating Zoe Hyrien — born between oceans and alleys.
    ]
  ],
  bibliography: bibliography("refs.bib"),
  figure-index: (enabled: true),
  table-index: (enabled: true),
  listing-index: (enabled: true),
)

= Layout
The template uses `A4` as its page size, you can specify a different #link("https://typst.app/docs/reference/layout/page#parameters-paper")[paper size string] using:

```typst
#show: ilm.with(
  paper-size: "us-letter",
)
```

'Ilm display's its content in the following order:
+ Cover page
+ Preface page (if defined)
+ Table of contents (unless disabled)
+ Body (your main content)
+ Appendix (if defined)
+ Bibliography (if defined)
+ Indices (if enabled) --- index of figures (images), tables, or listings (code blocks)

== Cover
The cover/title page has a title, author, date, and abstract which is a short description shown under the author name:

```typst
#show: ilm.with(
  title: [Your Title],
  author: "Author Name",
  date: datetime(year: 2024, month: 03, day: 19),
  abstract: [Your content goes here],
)
```

Only the `title` and `author` fields are necessary; `date` and `abstract` are optional.

By default, the date is shown in the format: `MMMM DD, YYYY`. You can change the date format by specifying a different format string:

```typst
#show: ilm.with(
  date-format: "[month repr:long] [day padding:zero], [year repr:full]",
)
```

See Typst's #link("https://typst.app/docs/reference/foundations/datetime/#format")[official documentation] for more info on how date format strings are defined.

== Preface
The preface content is shown on its own separate page after the cover page.

You can define it using:

```typst
#show: ilm.with(
  preface: [
    = Preface Heading
    Your content goes here.
  ],
)
```

#emoji.fire Tip: if your preface is quite long then you can define it in a separate file and import it in the template definition like so:

```typst
#show: ilm.with(
  // Assuming your file is called `preface.typ` and is
  // located in the same directory as your main Typst file.
  preface: [#include "preface.typ"],
)
```

== Table of Contents
By default, 'Ilm display a table of contents before the body (your main content). You can disable this behavior using:

```typst
#show: ilm.with(
  table-of-contents: none,
)
```

The `table-of-contents` option accepts the result of a call to the `outline()` function, so if you want to customize the behavior of table of contents then you can specify a custom `outline()` function:

```typst
#show: ilm.with(
  table-of-contents: outline(title: "custom title"),
)
```

See Typst's #link("https://typst.app/docs/reference/model/outline/")[official documentation] for more information.

== Body
By default, the template will insert a #link("https://typst.app/docs/reference/layout/pagebreak/")[pagebreak] before each chapter, i.e. first-level heading. You can disable this behavior using:

```typst
#show: ilm.with(
  chapter-pagebreak: false,
)
```

== Appendices
The template can display different appendix, if you enable and define it:

```typst
#show: ilm.with(
  appendix: (
    enabled: true,
    title: "Appendix", // optional
    heading-numbering-format: "A.1.1.", // optional
    body: [
      = First Appendix
      = Second Appendix
    ],
  ),
)
```

The `title` and `heading-numbering-format` options can be omitted as they are optional and will default to predefined values.

#emoji.fire Tip: if your appendix is quite long then you can define it in a separate file and import it in the template definition like so:

```typst
#show: ilm.with(
  appendix: (
    enabled: true,
    // Assuming your file is called `appendix.typ` and is
    // located in the same directory as your main Typst file.
    body: [#include "appendix.typ"],
  ),
)
```

== Bibliography
If your document contains references and you want to display a bibliography/reference listing at the end of the document but before the indices then you can do so by defining `bibliography` option:

```typst
#show: ilm.with(
  // Assuming your file is called `refs.bib` and is
  // located in the same directory as your main Typst file.
  bibliography: bibliography("refs.bib"),
)
```

The `bibliography` option accepts the result of a call to the `bibliography()` function, so if you want to customize the behavior of table of contents then you can do so by customizing the `bibliography()` function that you specify here. See Typst's #link("https://typst.app/docs/reference/model/bibliography/")[official documentation] for more information.

== Indices
The template also displays an index of figures (images), tables, and listings (code blocks) at the end of the document, if you enable them:

```typst
#show: ilm.with(
  figure-index: (
    enabled: true,
    title: "Index of Figures" // optional
  ),
  table-index: (
    enabled: true,
    title: "Index of Tables" // optional
  ),
  listing-index: (
    enabled: true,
    title: "Index of Listings" // optional
  ),
)
```

The `title` option can be omitted as it is optional and will default to predefined values.

== Footer
If a page does not begin with a chapter then the chapter's name, to which the current section belongs to, is shown in the footer.

Look at the page numbering for the current page down below. It will show "#upper[Layout]" next to the page number because the current subheading _Footer_ is part of the _Layout_ chapter.

When we say chapter, we mean the the first-level or top-level heading which is defined using a single equals sign (`=`).

== Story

Zoe wakes to the soft percussion of Seattle rain. The city folds itself around her apartment like a familiar book; steam lifts from a nearby cafe and the morning smells of coffee and wet cedar. For a moment she holds both the damp sound of her window and a memory of Paris — a different grey, a different light — as if two cities have braided inside her.

She spent her childhood slipping between places: summers in France with long, slow breakfasts and evenings that smelled of thyme; school years in New York where taxis shouted and neon had a difficult, honest glow; days in Seattle when fog felt like a shawl and the water seemed to be listening. Each city taught her a language. In France she learned how to linger. In New York she learned how to arrive. In Seattle she learned how to watch.

On this particular morning she decides to walk to the market, to carry a small basket and return through streets that remember her footprints. A woman with a red scarf greets her as if they have always been friends; a child chases pigeons with a seriousness that seems sacred. Zoe lets herself slow, tasting the ordinary as if it were a revelation.

At noon she writes a letter to an old friend in Paris, folding her sentences like maps. In the afternoon she rides the ferry and watches the city pull away, its outline softening. At dusk she thinks of New York — the sudden burst of light, the late dinners that felt like ceremonies — and she realizes that home is not one place but a gathering of small, exact details stored inside her.

That night she opens a book of poems in French and reads aloud, listening to how the language makes the room different. Somewhere between the syllables and the rain she understands that being "GREAT" is not about a single grand thing but about the gravity she brings to the small, true acts of living: a careful hello, a remembered recipe, a willingness to be moved by light on wet pavement.

She sleeps, holding the three cities close, and dreams of bridges — the bridges she has crossed, the ones she will build, and the ones that quietly hold her steady.

== External links
'Ilm adds a small maroon circle to external (outgoing) links #link("https://github.com/talal/ilm")[like so].

This acts as a hint for the reader so that they know that a specific text is a hyperlink. This is far better than #underline[underlining a hyperlink] or making it a #text(fill: blue)[different color]. Don't you agree?

If you want to disable this behavior then you can do so by setting the concerning option to `false`:

```typst
#show: ilm.with(
  external-link-circle: false,
)
```

== Blockquotes
'Ilm also exports a `blockquote` function which can be used to create blockquotes. The function has one argument: `body` of the type content and can be used like so:

```typst
#blockquote[
  A wizard is never late, Frodo Baggins. Nor is he early. He arrives precisely when he means to.
  --- Gandalf
]
```

The above code will render the following:

#blockquote[
  A wizard is never late, Frodo Baggins. Nor is he early. He arrives precisely when he means to.
  --- Gandalf
]

== Small- and all caps
'Ilm also exports functions for styling text in small caps and uppercase, namely: `smallcaps` and `upper` respectively.

These functions will overwrite the standard #link("https://typst.app/docs/reference/text/smallcaps/")[`smallcaps`] and #link("https://typst.app/docs/reference/text/upper/")[`upper`] functions that Typst itself provides. This behavior is intentional as the functions that 'Ilm exports fit in better with the rest of the template's styling.

Here is how Typst's own #std-smallcaps[smallcaps] and #std-upper[upper] look compared to the 'Ilm ones:\
#hide[Here is how Typst's own ] #smallcaps[smallcaps] and #upper[upper]

They both look similar, the only difference being that 'Ilm uses more spacing between individual characters.

If you prefer Typst's default spacing then you can still use it by prefixing `std-` to the functions:

```typst
#std-smallcaps[your content here]
#std-upper[your content here]
```

== Tables
In order to increase the focus on table content, we minimize the table's borders by using thin gray lines instead of thick black ones. Additionally, we use small caps for the header row. Take a look at the table below:

#let unit(u) = math.display(math.upright(u))
#let si-table = table(
  columns: 3,
  table.header[Quantity][Symbol][Unit],
  [length], [$l$], [#unit("m")],
  [mass], [$m$], [#unit("kg")],
  [time], [$t$], [#unit("s")],
  [electric current], [$I$], [#unit("A")],
  [temperature], [$T$], [#unit("K")],
  [amount of substance], [$n$], [#unit("mol")],
  [luminous intensity], [$I_v$], [#unit("cd")],
)

#figure(caption: ['Ilm's styling], si-table)

For comparison, this is how the same table would look with Typst's default styling:

#[
  #set table(inset: 5pt, stroke: 1pt + black)
  #show table.cell.where(y: 0): it => {
    v(0.5em)
    h(0.5em) + it.body.text + h(0.5em)
    v(0.5em)
  }
  #figure(caption: [Typst's default styling], si-table)
]

= Code
== Custom formatting
'Ilm uses the _Iosevka_@wikipedia_iosevka font for raw text instead of the default _Fira Mono_. If Iosevka is not installed then the template will fall back to Fira Mono.

#let snip(cap) = figure(caption: cap)[
  ```rust
  fn main() {
      let user = ("Adrian", 38);
      println!("User {} is {} years old", user.0, user.1);

      // tuples within tuples
      let employee = (("Adrian", 38), "die Mobiliar");
      println!("User {} is {} years old and works for {}", employee.0.1, employee.0.1, employee.1);
  }
  ```
]

#[
  #show raw: set text(font: "Fira Mono")
  For comparison, here is what `code` in Fira Mono looks like:
  #snip("Code snippet typeset in Fira Mono font")
]

#[
  #show raw: set text(font: ("Iosevka", "Fira Mono"))
  and here is how the same `code` looks in Iosevka:
  #snip("Code snippet typeset in Iosevka font")
]

In the case that both code snippets look identical then it means that Iosevka is not installed on your computer.

You can disable 'Ilm's custom raw text formatting using the `raw-text` option:

```typst
#show: ilm.with(
  raw-text: (
    use-typst-defaults: true,
  ),
)
```

Additionally, you can specify your own custom font and size using:

```typst
#show: ilm.with(
  raw-text: (
    // custom-font takes a list of fonts in order of priority.
    custom-font: ("JetBrains Mono", "Cascadia Mono"),
    custom-size: 10pt,
  ),
)
```
